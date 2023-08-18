import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:dashboard/view/widget/general_inpu_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/status_request.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/hover_button.dart';
import '../../widget/no_internet_page.dart';
import 'add_new_reservation_controller.dart';

// ignore: must_be_immutable
class AddReservation extends StatelessWidget {
  int eventId;
  AddReservation({ required this.eventId});
  AddNewReservationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.eventId=eventId;
    Sizes size = Sizes(context);
    return GetBuilder<AddNewReservationController>(
        builder: (ctx) => controller.statuseRequest ==
                StatuseRequest.offlinefailure
            ? noInternetPage(size, controller)
            : Form(
                key: controller.formstate,
                child: Container(
                  height: Get.size.height * .9,
                  width: context.widthInches > 5.5 ? 400 : Get.size.width * .85,
                  color: Get.isDarkMode ? Colors.black54 : skinColorWhite,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        createAppBar(size),
                        SizedBox(
                          height: sharedPreferences!.getString('lang') == 'en'
                              ? Get.size.height * .02
                              : Get.size.height * .01,
                        ),
                        dividerWithWord(
                          'Enter new reservation information'.tr,
                          icon: Icon(
                            Icons.event_available_rounded,
                            color: Get.isDarkMode
                                ? darkPrimaryColor
                                : primaryColor,
                          ),
                        ),
                        const SizedBox(height: 40),
                        generalInputTextFeild(
                            size,
                            Icons.person,
                            'Customer name'.tr,
                            (value)  {
                          controller.customerName=value!;
                        },
                            TextInputType.name, (value) {
                        if (value!.length < 2) {
                            return "The name is not valid".tr;
                          }
                          return null;
                        }),
                        generalInputTextFeild(
                            size,
                            Icons.confirmation_number,
                            'Number of setes'.tr,
                            (value)  {
                          controller.numberOfSets=value!;
                        },
                            TextInputType.number, (value) {
                         if (int.parse(value!) < 2) {
                            return "The number is not valid".tr;
                          }
                          return null;
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                        HoverButton(
                          mycolor:
                              Get.isDarkMode ? darkPrimaryColor : primaryColor,
                          myRadius: size.buttonRadius,
                          ontap: () {
                            controller.onPressDone();
                          },
                          mywidth: size.normalButtonWidht,
                          myheight: size.normalButtonHeight,
                          myShadow: 0,
                          child: controller.statuseRequest ==
                                  StatuseRequest.loading
                              ? Container(
                                  padding: const EdgeInsets.all(2),
                                  child: CircularProgressIndicator(
                                    color: Get.isDarkMode
                                        ? skinColorWhite
                                        : backGroundDarkColor,
                                  ),
                                )
                              : AutoSizeText(
                                  'Done'.tr,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: size.normalButtonTextSize,
                                    fontFamily: jostFontFamily,
                                    color: Get.isDarkMode
                                        ? skinColorWhite
                                        : backGroundDarkColor,
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                )));
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
          child: AutoSizeText('Add new reservation'.tr,
              presetFontSizes: const [28, 35, 25, 23],
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
