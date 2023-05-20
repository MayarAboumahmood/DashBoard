import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/data/Models/login_model.dart';
import 'package:dashboard/data/Models/user_model.dart';
import 'package:dashboard/data/checkInternet/checkInternet.dart';
import 'package:dashboard/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_service.dart';
import 'package:dashboard/constant/statusRequest.dart';

class LoginController extends GetxController {
  late String password;
  late String email;
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late RxBool passwordSecure = true.obs;
  LoginService service = LoginService();
  late GlobalKey<FormState> formstate;

  @override
  void onInit() async {
    password = '123';
    email = '';
    formstate = GlobalKey<FormState>();
    checkIfTheInternetIsConectedBeforGoingToThePage();
    super.onInit();
  }

  Future checkIfTheInternetIsConectedBeforGoingToThePage() async {
    try {
      var re = await checkInternet();
      if (re) {
        statuseRequest = StatuseRequest.init;
      } else {
        statuseRequest = StatuseRequest.offlinefailure;
      }
    } catch (e) {
      statuseRequest = StatuseRequest.offlinefailure;
    }

    update();
  }

  void changePasswordSecure() {
    passwordSecure.value = !passwordSecure.value;
  }

  void onpresslogin() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      statuseRequest = StatuseRequest.loading;
      update();
      LoginModel model = LoginModel(password: password, email: email);
      var response = await logindata(
          model); // check if the return data is statuseRequest or real data
      statuseRequest = handlingData(response); //return the statuseResponse
      if (statuseRequest == StatuseRequest.success) {
        if (response['msg'] == "Login Success") {
         whenLoginSuccess(response);
         
        }
      } else if (statuseRequest == StatuseRequest.authfailuer) {
        snackBarForErrors();
      } else if (statuseRequest == StatuseRequest.validationfailuer) {
        snackBarForErrors();
      } else {
        // when happen a mestake we handel it here
      }
    }
    update();
  }

  SnackbarController snackBarForErrors() {
    //// that need edit design for notifications

    return Get.snackbar(
      "Incorrect email or password".tr,///// adding for translate  done
      "Try entering your data again".tr ,//// adding for translate  done
      snackPosition: SnackPosition.TOP,
      colorText: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
          backgroundColor:  Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
      
      duration:const Duration(seconds: 5)
    );
  }

  logindata(LoginModel model) async {
    var response = await service.login(model);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  whenLoginSuccess(response) async {
    Map<String, dynamic> data = response[
        'data']; // for getting a body of data from map and save a token in local dataBase
    UserModel.userToken = response['token'];
    UserModel.id = data['admin_id'] as int;
    await prefService.createString(
        'token', UserModel.userToken); // storing token
    await prefService.createString('id', UserModel.id.toString());
    statuseRequest = StatuseRequest.init; //  here put a navigator instruction
    update();
  }
}
