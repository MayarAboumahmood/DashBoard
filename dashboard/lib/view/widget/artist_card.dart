import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';

// ignore: must_be_immutable
class ArtistCard extends StatelessWidget {
  String title;
  String subTitle;
  ArtistCard({super.key, required this.title, required this.subTitle});
  ArtistCardController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: MaterialButton(
            onPressed: () {
              controller.changeListTileTapedState();
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
                    title,
                    style: generalTextStyle(null),
                  ),
                  subtitle: Text(subTitle, style: generalTextStyle(null)),
                  trailing: Obx(
                    () => Visibility(
                        visible: controller.isTaped.value,
                        child: const Icon(Icons.check_circle)),
                  )),
            )));
  }
}

class ArtistCardController extends GetxController {
  RxBool isTaped = false.obs;
  void changeListTileTapedState() {
    isTaped.value = !isTaped.value;
  }
}
