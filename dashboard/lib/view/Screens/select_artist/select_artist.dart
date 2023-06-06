import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/artist_card.dart';
import '../../widget/general_text_style.dart';
import '../../widget/hover_button.dart';
import '../add_artist/add_artist.dart';

class SelectArtist extends StatelessWidget {
  const SelectArtist({super.key});

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
            dividerWithWord('Select artists to the event'.tr),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                height: 400,
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      ArtistCard(title: 'title', subTitle: 'subTitle'),
                  itemCount: 5,
                )),
            SizedBox(
              height: Get.size.height * .1,
            ),
            HoverButton(
              ontap: () {
                showAddArtistDialog(context);
              },
              mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              myRadius: size.buttonRadius,
              mywidth: size.normalButtonWidht,
              myheight: size.normalButtonHeight,
              child: Text('Add artist'.tr, style: generalTextStyle(null)),
            ),
            const SizedBox(height: 10),
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

  void showAddArtistDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: const AddArtist(),
        );
      },
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
          child: Text('Select from the artist'.tr,
              style: TextStyle(
                fontFamily: jostFontFamily,
                fontSize: 35,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              )),
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
