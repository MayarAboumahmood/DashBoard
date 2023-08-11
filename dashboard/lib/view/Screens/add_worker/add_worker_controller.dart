// ignore_for_file: avoid_print
// import 'dart:html';


import 'dart:typed_data';
import 'package:dashboard/view/widget/snak_bar_for_errors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/data/Models/worker_model.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_worker_service.dart';

class AddWorkerController extends GetxController
    implements StatuseRequestController {
  String selctFile = '';
  Uint8List selectedImageInBytes = Uint8List(8);

  bool webImageExcist = false;
  late String firstName;
  late String lastName;
  late String email;
  late String numberPhone;
  late String information;
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late GlobalKey<FormState> formstate;
  AddWorkerService service = AddWorkerService();
  @override
  void onInit() {
    firstName = '';
    lastName = '';
    email = '';
    numberPhone = '';
    information = '';
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  Future<void> pickImage() async {
    FilePickerResult? fileResult =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (fileResult != null) {
      print("file picked");
      selctFile = fileResult.files.first.name;
      selectedImageInBytes = fileResult.files.first.bytes!;
      webImageExcist=true;
      update();
    }
  }

  onPressDone() async {
    FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      statuseRequest = StatuseRequest.loading;
      update();
      WorkerModel model = WorkerModel(
          email: email,
          lastName: lastName,
          firstName: firstName,
          numberPhone: numberPhone);

      dynamic response = await addWorkerData(
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

  

  addWorkerData(WorkerModel model) async {
    String token = await prefService.readString('token');
     Map<String, String> data = {
          'email': model.email,
          'first_name': model.firstName,
          'last_name': model.lastName,
          'phone_number': model.numberPhone,
          'password':'12345678',
        
        };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.addWorker(data, selectedImageInBytes, selctFile,token);
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
    Get.offAllNamed('/WorkerManagementPage');
    update();
  }
}
