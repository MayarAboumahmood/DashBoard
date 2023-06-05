import 'dart:typed_data';

import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventController extends GetxController
    implements StatuseRequestController {
  String selctFile = '';
  Uint8List selectedImageInBytes = Uint8List(8);
  Uint8List webImage = Uint8List(8);
  bool webImageExcist = false;
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;

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
}
