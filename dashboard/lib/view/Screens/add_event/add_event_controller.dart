import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddEventController extends GetxController {
  RxString selectedImage = ''.obs;
  Uint8List webImage = Uint8List(8);
  RxBool webImageExcist = false.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (!GetPlatform.isWeb) {
      if (pickedImage != null) {
        selectedImage = pickedImage.path.obs;
        update();
      } else {
        debugPrint('no image have been selected');
      }
    } else if (GetPlatform.isWeb) {
      if (pickedImage != null) {
        var f = await pickedImage.readAsBytes();
        webImage = f;
        webImageExcist.value = true;
      } else {}
    } else {
      debugPrint('something wont wrong!');
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
