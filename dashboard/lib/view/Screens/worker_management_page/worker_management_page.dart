import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/widget/slide_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/costum_text_field.dart';
import '../add_worker/add_worker.dart';
import '../setting/setting_page.dart';

// ignore: must_be_immutable
class WorkerManagementPage extends StatelessWidget {
  WorkerManagementPage({super.key});
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    List<Widget> workerList = [
      workerCard(context, size, 'assets/images/The project icon.jpg', 'Mayar',
          'mayar abou mahmood work at the house sense 27/7/2022  and I never nothic any problem with him.'),
      workerCard(context, size, 'assets/images/The project icon.jpg', 'Omar',
          'workerDetails'),
      workerCard(context, size, 'assets/images/The project icon.jpg', 'Sham',
          'workerDetails'),
      workerCard(context, size, 'assets/images/The project icon.jpg', 'Mari',
          'workerDetails'),
    ];
    GetDeviceType getDeviceType = GetDeviceType();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showAddWorkerDialog(context);
          },
          label: Text(
            'Add worker'.tr,
            style: TextStyle(
              fontFamily: jostFontFamily,
            ),
          )),
      appBar: createAppBar(size, context, getDeviceType),
      body: Row(children: [
        SlideDrawer(),
        Flexible(
          fit: FlexFit.tight,
          child: GridView.builder(
              itemCount: workerList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.widthInches > 11
                    ? 3
                    : context.widthInches > 8.5
                        ? 2
                        : 1,
                childAspectRatio: 1.7,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                mainAxisExtent: 200,
              ),
              itemBuilder: (BuildContext context, int index) {
                return workerList[index];
              }),
        )
      ]),
    );
  }

  Widget workerCard(BuildContext context, Sizes size, String workerImage,
      String workerName, String workerDetails) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.size.width * .01),
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
            ClipOval(
              child: SizedBox(height: 50, child: Image.asset(workerImage)),
            ),
            SizedBox(
              width: context.widthInches > 5 ? 10 : 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(workerName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: jostFontFamily,
                      color:
                          Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                      fontSize: 14,
                    )),
                SizedBox(
                  height: 120,
                  width: context.widthInches > 11
                      ? 125
                      : context.widthInches > 8.5
                          ? 170
                          : context.widthInches < 6
                              ? 150
                              : 200,
                  child: AutoSizeText(workerDetails,
                      softWrap: true,
                      overflowReplacement: Text(
                        '...',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Get.isDarkMode
                              ? skinColorWhite
                              : backGroundDarkColor,
                          // fontSize: 12,
                        ),
                      ),
                      maxLines: 6,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontFamily: jostFontFamily,
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor,
                        // fontSize: 12,
                      )),
                ),
                SizedBox(
                  width: context.widthInches > 5 ? 6 : 4,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar createAppBar(
      Sizes size, BuildContext context, GetDeviceType getDeviceType) {
    return AppBar(
      actions: [
        searchField(size, getDeviceType, context),
        SizedBox(
          width: Get.size.width * .01,
        ),
        IconButton(
          onPressed: () {
            showSettingsDialog(
              context,
            );
          },
          icon: const Icon(
            Icons.settings,
          ),
        ),
      ],
      title: Text(
        'Worker management'.tr,

        /// nees to add for translate
        style: TextStyle(
            // color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            fontSize: size.appBarTextSize / 2,
            fontFamily: jostFontFamily,
            fontWeight: FontWeight.w100),
      ),
    );
  }

  Widget searchField(
      Sizes size, GetDeviceType getDeviceType, BuildContext context) {
    return Visibility(
      visible:
          getDeviceType.getDevicetype(context) == 'computer' ? true : false,
      replacement: IconButton(
        icon: Icon(
          Icons.search,
          color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
        ),
        onPressed: () {}, //take us to the search page.
      ),
      child: SizedBox(
        height: Get.size.height * .01,
        width: Get.size.width * .2,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CostumTextField(
              labelStyle: TextStyle(
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              widthOnTheScreen: size.textFieldWidth,
              onsaved: (value) {},
              hint: 'Search'.tr,
              hintStyle: TextStyle(
                  fontFamily: jostFontFamily,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              prefixIcon: const Icon(
                Icons.search,
                // color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              ),
              sucer: false,
            )),
      ),
    );
  }

  void showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Setting(),
        );
      },
    );
  }

  void showAddWorkerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: AddWorker(),
        );
      },
    );
  }
}
