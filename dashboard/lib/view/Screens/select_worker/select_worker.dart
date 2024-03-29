import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/general_text_style.dart';
import '../../widget/hover_button.dart';

class SelectWorker extends StatelessWidget {
  const SelectWorker({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Container(
      height: Get.size.height * .9,
      width: context.widthInches > 5.5 ? 400 : Get.size.width * .85,
      color: Get.isDarkMode ? Colors.black54 : skinColorWhite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            createAppBar(size),
            dividerWithWord('Select worker to the order'.tr),
            const SizedBox(height: 20),
          /*  SizedBox(
                width: double.infinity,
                height: 400,
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      ArtistCard(title: 'worker name', subTitle: ''),
                  itemCount: 5,
                ))*/
            SizedBox(
              height: Get.size.height * .1,
            ),
            HoverButton(
              ontap: () {},
              mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              myRadius: size.buttonRadius,
              mywidth: size.normalButtonWidht,
              myheight: size.normalButtonHeight,
              child: Text('Done'.tr, style: generalTextStyle(null)),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Row createAppBar(Sizes size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.size.width * .01,
              vertical: sharedPreferences!.getString('lang') == 'en'
                  ? Get.size.width * .01
                  : 0),
          child: SizedBox(
            width: 200,
            child: AutoSizeText('Select from the worker'.tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: jostFontFamily,
                  fontSize: 35,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.size.width * .01),
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                size: 35,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              )),
        ),
      ],
    );
  }
}
