// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/hover_button.dart';
import '../../widget/worekr_event_info_card.dart';

// ignore: must_be_immutable
class WorkerEventInfo extends StatelessWidget {
  List<WorkerEventInfoCard> workerMoneyInEvent = [
    WorkerEventInfoCard(
        evnetWorker: EventWorker(money: 100, orderDetails: 'djlkfsfjlkd')),
    WorkerEventInfoCard(
        evnetWorker: EventWorker(money: 200, orderDetails: 'djlkfsfjlkd')),
    WorkerEventInfoCard(
        evnetWorker: EventWorker(money: 300, orderDetails: 'djlkfsfjlkd')),
    WorkerEventInfoCard(
        evnetWorker: EventWorker(money: 400, orderDetails: 'djlkfsfjlkd')),
    WorkerEventInfoCard(
        evnetWorker: EventWorker(money: 400, orderDetails: 'djlkfsfjlkd')),
  ];
  WorkerEventInfo({super.key});

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
            SizedBox(
              height: sharedPreferences!.getString('lang') == 'en'
                  ? Get.size.height * .02
                  : Get.size.height * .01,
            ),
            dividerWithWord(
              'The worker info'.tr,
              icon: Icon(
                Icons.info,
                color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            buildDetailsList(context, workerMoneyInEvent),
            const SizedBox(height: 10),
            HoverButton(
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
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildDetailsList(
      BuildContext context, List<WorkerEventInfoCard> workerMoneyInEvent) {
    return SizedBox(
      width: context.widthInches > 5.5 ? 390 : Get.size.width * .83,
      height: workerMoneyInEvent.length * 75,
      child: ListView.builder(
          itemCount: workerMoneyInEvent.length,
          itemBuilder: (context, index) {
            return workerMoneyInEvent[index];
          }),
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
          child: Text('Worker event info', //workerList[id].name info in event
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

class EventWorker {
  // String date;
  // String eventName;
  // int workerId;
  // int orderId;
  // String ordertime;
  double money;
  String orderDetails;
  EventWorker({
    // required this.date,
    // required this.eventName,
    // required this.workerId,
    // required this.orderId,
    required this.orderDetails,
    required this.money,
    // required this.ordertime,
  });
}
