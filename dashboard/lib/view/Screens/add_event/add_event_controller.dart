import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/snak_bar_for_errors.dart';
import 'add_event_service.dart';

class AddEventController extends GetxController
    implements StatuseRequestController {
  String selctFile = '';
  Uint8List selectedImageInBytes = Uint8List(8);
  Uint8List webImage = Uint8List(8);
  bool webImageExcist = false;
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late GlobalKey<FormState> formstate;
  AddEventService service = AddEventService();
  late String title;
  late String availablePlaces;
  late String beginDate;
  late String description;
  late String ticketPrice;
  late String bandName;
  @override
  void onInit() {
    title = '';
    availablePlaces = ' ';
    beginDate = '';
    description = '';
    ticketPrice = '';
    bandName = '';
    formstate = GlobalKey<FormState>();

    super.onInit();
  }

  Future<void> pickImage() async {
    FilePickerResult? fileResult =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (fileResult != null) {
      selctFile = fileResult.files.first.name;
      selectedImageInBytes = fileResult.files.first.bytes!;
      webImageExcist = true;
      update();
    }
  }

  DateTime? selectedDate;
  RxBool isSelectedDateIsNull = true.obs;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(DateTime.now().year + 3),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    isSelectedDateIsNull.value = selectedDate == null;
    update();
  }

  onPressDone() async {
    FormState? formdata = formstate.currentState;
    print("pefore if validate");
    if (formdata!.validate()) {
      print("after if validate");
      print(formstate.currentState);
      formdata.save();
      print(" before statuse");
      statuseRequest = StatuseRequest.loading;
      update();
      // EventModel model = EventModel(
      //     title: title,
      //     availablePlaces: availablePlaces,
      //     beginDate: beginDate,
      //     description: description,
      //     ticketPrice: ticketPrice,
      //     bandName: bandName);
      print("pefore  send response ");
      dynamic response =
          await addWorkerData(); // check if the return data is statuseRequest or real data
      statuseRequest = handlingData(response); //return the statuseResponse
      if (statuseRequest == StatuseRequest.success) {
        whenAddSuccess(response);
      } else if (statuseRequest == StatuseRequest.authfailuer) {
        snackBarForErrors("Auth error", "Please login again");
        Get.offAllNamed('LoginPage');
      } else if (statuseRequest == StatuseRequest.validationfailuer) {
        snackBarForErrors("Inputs wrong", "Please theck your inputs");
      } else {
        snackBarForErrors("Server error", "Please try again later");
      }
    }
    update();
  }

  addWorkerData() async {
    String token = await prefService.readString('token');
    print("mmmmmmmmmmmmmmmmmm");
    Map<String, String> data = {
      "title": title,
      "description": description,
      "ticket_price": ticketPrice.toString(),
      "available_places": availablePlaces.toString(),
      "band_name": "hello",
      "begin_date": selectedDate.toString(),
      "admin_id": "2"
    };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.addEvent(data, selectedImageInBytes, selctFile, token);
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
    Get.offAllNamed('/EventPage');
    update();
  }
}
