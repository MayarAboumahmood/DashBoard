
import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/data/Models/admin_model.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/widget/snak_bar_for_errors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_admin_service.dart';

class AddAdminController extends GetxController  implements StatuseRequestController{
 late String name;
 late String email;
 late String password;
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late GlobalKey<FormState> formstate;
  late AddAdminService service ;
 
@override
  void onInit() {
name='';
email='';
password='';
service= AddAdminService();
 formstate = GlobalKey<FormState>();
    super.onInit();
  }
  onPressDone() async {
    FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      statuseRequest = StatuseRequest.loading;
      update();
      AdminModel model = AdminModel(
          email: email,
          name:name
         );

      dynamic response = await addData(
          model); // check if the return data is statuseRequest or real data
      statuseRequest = handlingData(response); //return the statuseResponse
      if (statuseRequest == StatuseRequest.success) {
          whenAddSuccess(response);
       
      } else if (statuseRequest == StatuseRequest.authfailuer) {
        snackBarForErrors("Auth error","Please login again");
        Get.offAllNamed('LoginPage');
      } else if (statuseRequest == StatuseRequest.validationfailuer) {
        snackBarForErrors("Inputs wrong","Please theck your inputs");
      } else {
        snackBarForErrors("Server error","Please try again later");
      
      }
    }
    update();
  }

  

  addData(AdminModel model) async {
    String token = await prefService.readString('token');
    Map<String,String> data={
      "admin_name":name,
      "email":email,
      "password":password,
      "is_super":"false"
    };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.addAdmin(data,token);
    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  whenAddSuccess(response) async {
    Get.offAllNamed('/AdminManagementPage');
    update();
  }
 
}
