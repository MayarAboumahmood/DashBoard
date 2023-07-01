import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/status_request.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/artist_card.dart';
import '../../widget/general_text_style.dart';
import '../../widget/hover_button.dart';
import '../../widget/no_internet_page.dart';
import '../add_artist/add_artist.dart';
import 'select_artist_controller.dart';

// ignore: must_be_immutable
class SelectArtist extends StatelessWidget {
  SelectArtist({super.key});
  SelectArtistController controller = Get.put(SelectArtistController());
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return GetBuilder<SelectArtistController>(
        builder: (ctx) =>
            controller.statuseRequest == StatuseRequest.offlinefailure
                ? noInternetPage(size, controller)
                : whenShowTheBodyAfterLoadingAndInternet(size, context));
  }

  whenShowTheBodyAfterLoadingAndInternet(Sizes size, BuildContext context) {
    return Container(
      height: Get.size.height * .9,
      width: context.widthInches > 5.5 ? 400 : Get.size.width * .85,
      color: Get.isDarkMode ? Colors.black54 : skinColorWhite,
      child: SingleChildScrollView(
    child: Column(
      children: [
        createAppBar(size, context),
        dividerWithWord('Select artists to the event'.tr),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 400,
          child: controller.statuseRequest == StatuseRequest.loading
              ? Center(
                  child:
                      Text("loading....".tr, style: generalTextStyle(14)),
                )
              : controller.finalListData.isEmpty
                  ? Center(
                      child: Text(
                        "No data found",
                        style: generalTextStyle(18),
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) => ArtistCard(
                        model: controller.finalListData[index],
                        controller: controller,
                        index: index,
                      ),
                      itemCount: controller.finalListData.length,
                    ),
        ),
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
          ontap: () {
            controller.onFinishSelected();
          },
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
          child: AddArtist(),
        );
      },
    );
  }

  Row createAppBar(Sizes size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.size.width * .01,
              vertical: sharedPreferences!.getString('lang') == 'en'
                  ? Get.size.width * .01
                  : 0),
          child: AutoSizeText('Select from the artist'.tr,
              presetFontSizes: const [28, 35, 25, 23],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: jostFontFamily,

                // fontSize: context.widthInches > 4.5 ? 35 : 25,
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
