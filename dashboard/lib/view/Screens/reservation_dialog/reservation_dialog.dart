import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/Screens/reservation_dialog/reservation_controller.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../data/Models/Event_info_model.dart';
import '../../../main.dart';
import '../../widget/hover_button.dart';
import '../../widget/reservation_card.dart';
import '../add_new_reservation/add_new_reservation.dart';

// ignore: must_be_immutable
class ReservationDialog extends StatelessWidget {
  ReservationController controller=Get.find();
  List<Reservation> data;
  int eventId;
  bool isPast;
  ReservationDialog(this.data,this.eventId,this.isPast);

  @override
  Widget build(BuildContext context) {
    controller.finalListData=data;
    Sizes size = Sizes(context);
    return GetBuilder<ReservationController>(
      builder: (ccontext) {
        return Container(
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
                  'The reservations'.tr,
                  icon: Icon(
                    Icons.event_available,
                    color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildReservationList(context, controller.finalListData),
                const SizedBox(
                  height: 15,
                ),
               isPast?const SizedBox(): addNewReservationButton(size, context),
                const SizedBox(
                  height: 15,
                ),
                doneButton(size)
              ],
            ),
          ),
        );
      }
    );
  }

  Widget buildReservationList(
      BuildContext context, List<Reservation> reservationList) {
    return SizedBox(
      height: reservationList.length * 85,
      width: context.widthInches > 5.5 ? 395 : Get.size.width * .83,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reservationList.length,
          itemBuilder: (context, index) {
            return ReservationCard(name: reservationList[index].customerName!, numberOfCustomers: reservationList[index].numberOfPlaces!);
          }),
    );
  }

  void showAddReservationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: AddReservation(eventId: eventId),
        );
      },
    );
  }

  Widget doneButton(Sizes size) {
    return HoverButton(
      mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      myRadius: size.buttonRadius,
      ontap: () {},
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
    );
  }

  Widget addNewReservationButton(Sizes size, BuildContext context) {
    return HoverButton(
      mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      myRadius: size.buttonRadius,
      ontap: () {
        showAddReservationDialog(context);
      },
      mywidth: 250,
      myheight: size.normalButtonHeight,
      myShadow: 0,
      child: AutoSizeText(
        'Add new reservation'.tr,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: size.normalButtonTextSize,
            fontFamily: jostFontFamily,
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
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
          child: Text('Reservations'.tr,
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
