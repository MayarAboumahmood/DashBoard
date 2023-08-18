import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/view/Screens/add_new_drink/add_new_drink_controller.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:dashboard/view/widget/general_inpu_text_field.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/hover_button.dart';
import '../../widget/no_internet_page.dart';

// ignore: must_be_immutable
class AddNewDrink extends StatelessWidget {
  AddNewDrink({super.key});
  AddNewDrinkController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return GetBuilder<AddNewDrinkController>(
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
                        'Enter the new drink information'.tr,
                        icon: Icon(
                          Icons.no_drinks,
                          color:
                              Get.isDarkMode ? darkPrimaryColor : primaryColor,
                        ),
                      ),
                      const SizedBox(height: 40),
                      generalInputTextFeild(
                          size,
                          Icons.no_drinks,
                          'Drink name'.tr,
                          'Name'.tr,
                          (value) {
                            controller.name = value!;
                          },
                          TextInputType.name,
                          (value) {
                            if (value!.length < 3) {
                              return "The name is shourt".tr;
                            }
                            return null;
                          }),
                      generalInputTextFeild(
                        size,
                        Icons.money,
                        'Enter drink unit price'.tr,
                        'Unit price'.tr,
                        (value) {
                          controller.price = value!;
                        },
                        TextInputType.number,
                        (value) {
                          value = value!.trim();

                          // Check if the price is a valid number
                          if (double.tryParse(value) == null) {
                            return "the price is not valid";
                          }

                          // Check if the price is non-negative
                          double price = double.parse(value);
                          if (price < 0) {
                            return "the price can not be less the 0";
                          }

                          // Price is valid
                          return null;
                        },
                      ),
                      generalInputTextFeild(
                        size,
                        Icons.money,
                        'Enter the total cost'.tr,
                        'Total cost'.tr,
                        (value) {
                          controller.totalcost = value!;
                        },
                        TextInputType.number,
                        (value) {
                          value = value!.trim();

                          // Check if the price is a valid number
                          if (double.tryParse(value) == null) {
                            return "the cost is not valid";
                          }

                          // Check if the price is non-negative
                          double price = double.parse(value);
                          if (price < 0) {
                            return "the cost can not be less the 0";
                          }

                          // Price is valid
                          return null;
                        },
                      ),
                      generalInputTextFeild(
                        size,
                        Icons.bubble_chart_rounded,
                        'Enter the avilable amount'.tr,
                        'Avilable amount'.tr,
                        (value) {
                          controller.aviableAmount = value!;
                        },
                        TextInputType.number,
                        (value) {
                          value = value!.trim();

                          // Check if the price is a valid number
                          if (double.tryParse(value) == null) {
                            return "the aviable amount is not valid";
                          }

                          // Check if the price is non-negative
                          double price = double.parse(value);
                          if (price < 0) {
                            return "the aviable amount can not be less the 0";
                          }

                          // Price is valid
                          return null;
                        },
                      ),
                      generalInputTextFeild(
                        size,
                        Icons.info,
                        'Enter the description'.tr,
                        'Description'.tr,
                        (value) {
                          controller.description = value!;
                        },
                        TextInputType.text,
                        (value) {
                          if (value!.length < 5) {
                            return "The description is not valid".tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          controller.pickImage();
                        },
                        child: Text(
                          'Select the drink image'.tr,
                          style: generalTextStyle(null),
                        ),
                      ),
                      const SizedBox(height: 5),
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
                        height: 15,
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
                                          : backGroundDarkColor,
                                    ),
                                  ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
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
          child: AutoSizeText('Add new drink'.tr,
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
