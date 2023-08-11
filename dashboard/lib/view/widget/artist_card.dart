import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';
import '../../data/Models/artist_model.dart';
import '../Screens/select_artist/select_artist_controller.dart';

// ignore: must_be_immutable
class ArtistCard extends StatelessWidget {
  ArtistModel model;
  SelectArtistController? controller;
  int index;
  ArtistCard({super.key, required this.model, this.controller,required this.index});
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: MaterialButton(
        onPressed: () {
          controller!.changeListTileTapedState(index);
        
        },
        child: Container(
          // padding:const EdgeInsets.symmetric(vertical:10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.buttonRadius),
            color: Get.isDarkMode
                ? const Color.fromARGB(255, 54, 54, 54)
                : Colors.grey[400],
          ),
          child: ListTile(
            title: Text(
              model.name,
              style: generalTextStyle(null),
            ),
            subtitle: Text(model.information, style: generalTextStyle(null)),
            trailing: Visibility(
                visible: controller!.isTaped[index],
                child: const Icon(Icons.check_circle)),
          ),
        ),
      ),
    );
  }
}

class ArtistCardController extends GetxController {
  RxBool isTaped = false.obs;
  void changeListTileTapedState() {
    isTaped.value = !isTaped.value;
  }
}
