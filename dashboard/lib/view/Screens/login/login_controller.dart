import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/data/Models/login_model.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/widget/no_internet_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_service.dart';

import 'package:dashboard/constant/status_request.dart';

class LoginController extends GetxController
    implements StatuseRequestController {
  late String password;
  late String email;
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late RxBool passwordSecure = true.obs;
  LoginService service = LoginService();
  late GlobalKey<FormState> formstate;

  @override
  void onInit() async {
    password = '123';
    email = '';
    formstate = GlobalKey<FormState>();
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    super.onInit();
  }
  
  void changePasswordSecure() {
    passwordSecure.value = !passwordSecure.value;
  }

  void onpresslogin() async {
    FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      statuseRequest = StatuseRequest.loading;
      update();
      LoginModel model = LoginModel(password: password, email: email);
      dynamic response = await logindata(
          model); // check if the return data is statuseRequest or real data
      statuseRequest = handlingData(response); //return the statuseResponse
      print(statuseRequest);
      if (statuseRequest == StatuseRequest.success) {
        if (response['msg'] == "Logged in Successfully") {
          whenLoginSuccess(response);
        }
      } else if (statuseRequest == StatuseRequest.authfailuer) {
        snackBarForErrors();
      } else if (statuseRequest == StatuseRequest.validationfailuer) {
        snackBarForErrors();
      } else {
       snackBarForErrors();
      }
   }
    update();
  }

  SnackbarController snackBarForErrors() {
    return Get.snackbar(
        "Incorrect email or password".tr, ///// adding for translate  done
        "Try entering your data again".tr, //// adding for translate  done
        snackPosition: SnackPosition.TOP,
        colorText: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
        backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
        duration: const Duration(seconds: 5));
  }

  logindata(LoginModel model) async {
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.login(model);

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
        print(data);
    await prefService.createString(
        'token', response['token']); // storing token
    await prefService.createString('id',data['admin_id'].toString());
    Get.offNamed('/Home');
    update();
  }
}
