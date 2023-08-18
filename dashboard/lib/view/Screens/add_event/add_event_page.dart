import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/view/Screens/add_event/add_event_controller.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:dashboard/view/widget/general_inpu_text_field.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:dashboard/view/widget/no_internet_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/artist_card_in_reservationUI.dart';
import '../../widget/hover_button.dart';
import '../select_artist/select_artist.dart';

// ignore: must_be_immutable
class AddEvent extends StatelessWidget {
  AddEvent({super.key});
  AddEventController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Form(
      key: controller.formstate,
      child: Container(
        height: Get.size.height * .9,
        width: context.widthInches > 5.5 ? 400 : Get.size.width * .85,
        color: Get.isDarkMode ? Colors.black54 : skinColorWhite,
        child: Center(
          child: GetBuilder<AddEventController>(
              builder: (ctx) =>
                  controller.statuseRequest == StatuseRequest.offlinefailure
                      ? noInternetPage(size, controller)
                      : whenShowTheBodyAfterLoadingAndInternet(size, context)),
        ),
      ),
    );
  }

  Widget whenShowTheBodyAfterLoadingAndInternet(
      Sizes size, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          createAppBar(size),
          SizedBox(
            height: sharedPreferences!.getString('lang') == 'en'
                ? Get.size.height * .02
                : Get.size.height * .01,
          ),
          dividerWithWord(
            'Enter new event information'.tr,
            icon: Icon(
              Icons.library_music_rounded,
              color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            ),
          ),
          const SizedBox(height: 40),
          generalInputTextFeild(
            size,
            Icons.groups_3,
            'Enter Event name'.tr,
            'Event name'.tr,
            (value) {
              controller.title = value!;
            },
            TextInputType.name,
            (value) {
              if (value!.length < 2) {
                return "The event name is very shourt".tr;
              }
              return null;
            },
          ),
          generalInputTextFeild(
            size,
            Icons.person,
            'Enter the max number of attandend'.tr,
            'max number of attandend'.tr,
            (value) {
              controller.availablePlaces = value!;
            },
            TextInputType.number,
            (value) {
              if (int.parse(value!) < 2) {
                return "The number is so shourt".tr;
              }
              return null;
            },
          ),
          generalInputTextFeild(
              size,
              Icons.money,
              'Enter the ticket price'.tr,
              'ticket price'.tr,
              (value) {
                controller.ticketPrice = value!;
              },
              TextInputType.number,
              (value) {
                if (int.parse(value!) < 50000) {
                  return "The price can't be less than 50000 ".tr;
                }
                return null;
              }),
          dividerWithWord('Add artist'.tr,
              icon: const Icon(Icons.groups_rounded)),
          const SizedBox(
            height: 10,
          ),
          controller.selectedArtist.isEmpty
              ? const SizedBox()
              : SizedBox(
                  height: controller.selectedArtist.length * 50,
                  child: artistGridView(context),
                ),
          HoverButton(
            ontap: () {
              showAddArtistDialog(context);
              /*on tap a new view will open to make the admin browes the excist artis and add a new one */
            },
            mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            myRadius: size.buttonRadius,
            mywidth: size.normalButtonWidht,
            myheight: size.normalButtonHeight,
            child: Text('Add artist'.tr, style: generalTextStyle(null)),
          ),
          const SizedBox(
            height: 10,
          ),
          generalInputTextFeild(
              size,
              Icons.info,
              'Enter band money'.tr,
              'artist money'.tr,
              (value) {
                controller.bandMoney = value!;
              },
              TextInputType.text,
              (value) {
                if (value!.length < 2) {
                  return "enter the artist cost".tr;
                }
                return null;
              }),
          const SizedBox(
            height: 10,
          ),
          dividerWithWord('description'.tr,
              icon: const Icon(Icons.info_outline_rounded)),
          generalInputTextFeild(
              size,
              Icons.info,
              'Enter the description'.tr,
              'description'.tr,
              (value) {
                controller.description = value!;
              },
              TextInputType.text,
              (value) {
                if (value!.length < 2) {
                  return "Please enter anthor information ".tr;
                }
                return null;
              }),
          GetX<AddEventController>(
            builder: (controller) => Column(
              children: [
                Text(
                  controller.isSelectedDateIsNull.value
                      ? 'No date selected'.tr
                      : '${controller.selectedDate!.year}-${controller.selectedDate!.month}-${controller.selectedDate!.day}',
                  style: generalTextStyle(null),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color?>(
                          Get.isDarkMode ? darkPrimaryColor : primaryColor)),
                  onPressed: () => controller.selectDate(context),
                  child: Text(
                    controller.isSelectedDateIsNull.value
                        ? 'Select date'.tr
                        : 'change date'.tr,
                    style: generalTextStyle(null),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(
                    Get.isDarkMode ? darkPrimaryColor : primaryColor)),
            onPressed: () {
              controller.pickImage();
            },
            child: Text(
              'Select the event image'.tr,
              style: generalTextStyle(null),
            ),
          ),
          const SizedBox(height: 5),
          controller.webImageExcist
              ? SizedBox(
                  width: 300,
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.selectedImageInBytes.length,
                    itemBuilder: (ctx, index) => Container(
                      margin: const EdgeInsets.all(20),
                      child: Image.memory(
                        controller.selectedImageInBytes[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ))
              : const SizedBox(),
          const SizedBox(
            height: 15,
          ),
          HoverButton(
            mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            myRadius: size.buttonRadius,
            ontap: () {
              controller.onPressDone();
            },
            mywidth: size.normalButtonWidht,
            myheight: size.normalButtonHeight,
            myShadow: 0,
            child: AutoSizeText(
              'Done'.tr,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: size.normalButtonTextSize,
                  fontFamily: jostFontFamily,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget artistGridView(BuildContext context) {
    return GridView.builder(
        itemCount: controller.selectedArtist.length,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 70,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) => artisCardView(
              controller.selectedArtist[index].name,
            ));
  }

  void showWorkerDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            // child: SelectWorker(),//to do to do to do to do to do to do to do....
          );
        });
  }

  void showAddArtistDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: SelectArtist(),
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
          child: AutoSizeText('Add new event'.tr,
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
              controller.selectedArtist.clear();
              controller.webImageExcist = false;
              controller.isSelectedDateIsNull.value = true;
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
