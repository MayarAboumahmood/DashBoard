import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../constant/font.dart';
import '../../constant/sizes.dart';
import '../../constant/theme.dart';
import '../../data/Models/worker_information.dart';
import 'divider_with_word.dart';
import 'general_text_style.dart';

// ignore: must_be_immutable
class WorkerEventInfoCard extends StatelessWidget {
  AllActionsModelForWorker workerAction;
  WorkerEventInfoCard({super.key, required this.workerAction});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.widthInches > 5 ? 7 : 7,
          vertical: Get.size.height * .01),
      margin: EdgeInsets.symmetric(
          horizontal: context.widthInches > 5 ? 7 : 7,
          vertical: Get.size.height * .01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.buttonRadius),
        color: Get.isDarkMode
            ? const Color.fromARGB(255, 54, 54, 54)
            : Colors.grey[400],
      ),
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workerAction.action.tr,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: jostFontFamily,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
            ),
            dividerWithWord('information'.tr),
            Text('-${workerAction.time}', style: generalTextStyle(18)),
            Text('-${workerAction.details}', style: generalTextStyle(18)),
          ],
        ),
    );
  }
}
