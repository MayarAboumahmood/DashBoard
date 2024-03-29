import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/sizes.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/data/Models/worker_model.dart';
import 'package:dashboard/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import '../../../constant/server_const.dart';

Widget adminCard(BuildContext context, Sizes size, String adminName,
    String adminDetails, int id) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.size.width * .01),
      child: GestureDetector(
          onTap: () {
            prefService.createString('adminId', id.toString());
            Get.toNamed('/AdminAllAction');
          },
          child: Container(
            width: 200,
            height: 50,
            padding: EdgeInsets.symmetric(
                horizontal: context.widthInches > 5 ? 7 : 7,
                vertical: Get.size.height * .02),
            margin: EdgeInsets.symmetric(
                horizontal: context.widthInches > 5 ? 7 : 7,
                vertical: Get.size.height * .02),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
              borderRadius: BorderRadius.circular(size.buttonRadius),
              color: Get.isDarkMode
                  ? const Color.fromARGB(255, 54, 54, 54)
                  : Colors.grey[400],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(adminName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: jostFontFamily,
                      color:
                          Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                      fontSize: 14,
                    )),
                Expanded(
                  child: SizedBox(
                    height: 120,
                    width: context.widthInches > 11
                        ? 125
                        : context.widthInches > 9.5
                            ? 170
                            : context.widthInches > 8.5
                                ? 145
                                : context.widthInches < 6
                                    ? 120
                                    : 200,
                    child: AutoSizeText(adminDetails,
                        softWrap: true,
                        overflowReplacement: Text(
                          '...',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Get.isDarkMode
                                ? skinColorWhite
                                : backGroundDarkColor,
                          ),
                        ),
                        maxLines: 6,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontFamily: jostFontFamily,
                          color: Get.isDarkMode
                              ? skinColorWhite
                              : backGroundDarkColor,
                        )),
                  ),
                ),
                SizedBox(
                  width: context.widthInches > 5 ? 6 : 4,
                ),
              ],
            ),
          )));
}

Widget workerCard(BuildContext context, Sizes size, WorkerModel model) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.size.width * .01),
    child: MaterialButton(
      onPressed: () {
        prefService.createString('Worker_id', model.id.toString());
        Get.toNamed('/WorkerInformationPage');
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.widthInches > 5 ? 7 : 7,
            vertical: Get.size.height * .02),
        margin: EdgeInsets.symmetric(
            horizontal: context.widthInches > 5 ? 7 : 7,
            vertical: Get.size.height * .02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.buttonRadius),
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 54, 54, 54)
              : Colors.grey[400],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 2,
                    color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
              ),
              child: SizedBox(
                  height: 70,
                  width: 70,
                  child: model.image == ''
                      ? CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          backgroundImage: const AssetImage(
                              'assets/images/The project icon.jpg'),
                          child: const SizedBox(),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          backgroundImage: NetworkImage(
                              "${ServerConstApis.loadImages}${model.image}"),
                          child: const SizedBox(),
                        )),
            ),
            SizedBox(
              width: context.widthInches > 5 ? 10 : 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text('${model.firstName} ${model.lastName}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: jostFontFamily,
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor,
                        fontSize: 14,
                      )),
                ),
                Expanded(
                  child: SizedBox(
                    height: 120,
                    width: context.widthInches > 11
                        ? 125
                        : context.widthInches > 9.5
                            ? 170
                            : context.widthInches > 8.5
                                ? 145
                                : context.widthInches < 6
                                    ? 120
                                    : 200,
                    child: AutoSizeText("workerDetails",
                        softWrap: true,
                        overflowReplacement: Text(
                          '...',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Get.isDarkMode
                                ? skinColorWhite
                                : backGroundDarkColor,
                          ),
                        ),
                        maxLines: 6,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontFamily: jostFontFamily,
                          color: Get.isDarkMode
                              ? skinColorWhite
                              : backGroundDarkColor,
                        )),
                  ),
                ),
                SizedBox(
                  width: context.widthInches > 5 ? 6 : 4,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
