import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddWorkerController extends GetxController {
  File? selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      update();
    }
  }
}
