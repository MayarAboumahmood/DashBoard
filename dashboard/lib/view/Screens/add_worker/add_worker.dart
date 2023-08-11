import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:dashboard/view/widget/general_inpu_text_field.dart';
import 'package:dashboard/view/widget/no_internet_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/costum_text_field.dart';
import '../../widget/general_text_style.dart';
import '../../widget/hover_button.dart';
import 'add_worker_controller.dart';

// ignore: must_be_immutable
class AddWorker extends StatelessWidget {
  AddWorker({super.key});
  AddWorkerController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return GetBuilder<AddWorkerController>(
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
                        'Enter new worker information'.tr,
                        icon: Icon(
                          Icons.person,
                          color:
                              Get.isDarkMode ? darkPrimaryColor : primaryColor,
                        ),
                      ),
                      const SizedBox(height: 40),
                      generalInputTextFeild(
                        size,
                        Icons.person,
                        'First name'.tr,
                        (value) {
                          controller.firstName = value!;
                        },
                        TextInputType.name,
                        (value) {
                          if (value!.length < 2) {
                            return "your name is shourtest than should be".tr;
                          }
                          return null;
                        },
                      ),
                      generalInputTextFeild(
                          size,
                          Icons.person,
                          'Last name'.tr,
                          (value) {
                            controller.lastName = value!;
                          },
                          TextInputType.name,
                          (value) {
                            if (value!.length < 2) {
                              return "your name is shourtest than should be"
                                  .tr; ////add to translate
                            }
                            return null;
                          }),
                      emailTextFeild(size),
                      generalInputTextFeild(
                          size,
                          Icons.phone,
                          'Phone number'.tr,
                          (value) {
                            controller.numberPhone = value!;
                          },
                          TextInputType.phone,
                          (value) {
                            if (value!.length < 10) {
                              return "The number phone should be 10 digits".tr;
                            }
                            return null;
                          }),
                      generalInputTextFeild(
                          size,
                          Icons.info,
                          'information'.tr,
                          (value) {
                            controller.information = value!;
                          },
                          TextInputType.text,
                          (value) {
                            if (value!.length < 5) {
                              return "Add more information about worker".tr;
                            }
                            return null;
                          }),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color?>(
                                Get.isDarkMode
                                    ? darkPrimaryColor
                                    : primaryColor)),
                        onPressed: () {
                          controller.pickImage();
                        },
                        child: Text('Select Image for worker'.tr,
                            style: generalTextStyle(null)),
                      ),
                      const SizedBox(height: 20),
                      controller.webImageExcist
                          ? SizedBox(
                              width: 200,
                              height: 200,
                              child: /*GetPlatform.isWeb
                            ? */
                                  Image.memory(
                                controller.selectedImageInBytes,
                                fit: BoxFit.contain,
                              )
                              /* : Image.file(
                                File(controller.selectedImage.value),
                                fit: BoxFit.contain,
                              ),*/
                              )
                          : const SizedBox(),
                      const SizedBox(
                        height: 10,
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
                        child:
                            controller.statuseRequest == StatuseRequest.loading
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
                                            : backGroundDarkColor),
                                  ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget emailTextFeild(Sizes size) {
    return CostumTextField(
      labelStyle: TextStyle(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      widthOnTheScreen: size.textFieldWidth,
      onsaved: (value) {
        controller.email = value!;
      },
      hint: 'enter your email'.tr,
      hintStyle: TextStyle(
          fontFamily: jostFontFamily,
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      label: "email".tr,
      prefixIcon: const Icon(
        Icons.email,
        // color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      ),
      sucer: false,
      validat: (value) {
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!);
        if (!emailValid) {
          return (("The inpout isn't an eamil").tr);

          ///add for translate
        }
        return null;
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
          child: AutoSizeText(
            presetFontSizes: const [28, 35, 25, 23],
            'Add new worker'.tr,
            style: TextStyle(
              fontFamily: jostFontFamily,
              fontSize: 35,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            ),
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
            ),
          ),
        ),
      ],
    );
  }
}
