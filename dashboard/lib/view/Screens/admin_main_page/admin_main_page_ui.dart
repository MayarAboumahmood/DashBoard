// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/font.dart';
import 'package:dashboard/view/widget/general_app_bar.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/slide_drawer.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  SlideDrawerController slideDrawerController = Get.find();
  Home({super.key});
  GetDeviceType getDeviceType = GetDeviceType();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    List<Worker> workerList = [
      Worker(age: '22', name: 'worker 1', numberOfEvents: 12),
      Worker(age: '24', name: 'worker 2', numberOfEvents: 13),
      Worker(age: '21', name: 'worker 3', numberOfEvents: 14),
      Worker(age: '31', name: 'worker 4', numberOfEvents: 16),
    ];

    return Scaffold(
      drawer: context.widthInches < 6 ? SlideDrawer() : null,
      appBar: createAppBar(size, context, getDeviceType, 'Home page'.tr),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(visible: context.widthInches > 6, child: SlideDrawer()),
            Flexible(
              child: Wrap(runAlignment: WrapAlignment.end, children: [
                homePageCard(size, 'total number of customer'.tr, '723',
                    'assets/images/tickets.png'),
                homePageCard(size, 'number of drinks'.tr, '25',
                    'assets/images/drinks.png'),
                homePageCard(size, 'total number of events'.tr, '9',
                    'assets/images/concert.png'),
                setWorkersHomePageCard(
                    size, context, workerList, slideDrawerController)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget setWorkersHomePageCard(Sizes size, BuildContext context,
    List<Worker> workerList, SlideDrawerController slideDrawerController) {
  return Center(
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.all(10),
        height: context.widthInches > 6.3
            ? workerList.length * 55
            : context.widthInches < 6.16 && context.widthInches > 6
                ? workerList.length * 110
                : workerList.length * 85,
        width: Get.size.width * .9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.buttonRadius),
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 54, 54, 54)
              : Colors.grey[400],
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: workerList.length * 2,
          itemBuilder: (context, index) {
            if (index.isOdd) {
              return Divider(
                color: skinColorWhite,
                height: 0,
              );
            }
            final itemIndex = index ~/ 2;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      AutoSizeText(
                        maxLines: 1,
                        workerList[itemIndex].name,
                        style: generalTextStyle(25),
                      ),
                      const Spacer(),
                      const SizedBox(
                        width: 5,
                      ),
                      Visibility(
                        visible: context.widthInches > 6.3,
                        child: AutoSizeText(
                          maxLines: 2,
                          'participited in: ${workerList[itemIndex].numberOfEvents} events',
                          style: generalTextStyle(20),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Visibility(
                    visible: context.widthInches < 6.3,
                    child: AutoSizeText(
                      maxLines: 2,
                      'number of events participited in: ${workerList[itemIndex].numberOfEvents}',
                      style: generalTextStyle(20),
                    ),
                  ),
                ],
              ),
            );
          },
        )),
  );
}

Widget homePageCard(
    Sizes size, String title, String details, String imagePath) {
  return SizedBox(
    height: size.bigButtonHeight + 10,
    width: size.bigButtonWidht + 10,
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: size.bigButtonHeight,
          width: size.bigButtonWidht,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              borderRadius: BorderRadius.circular(size.buttonRadius)),
        ),
        SizedBox(
          height: size.bigButtonHeight - 10,
          width: size.bigButtonWidht - 10,
          child: Image.asset(imagePath),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: size.bigButtonHeight,
          width: size.bigButtonWidht,
          decoration: BoxDecoration(
              color: backGroundDarkColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(size.buttonRadius)),
        ),
        Positioned(
          top: 10,
          left: 20,
          child: Column(
            children: [
              SizedBox(
                width: size.bigButtonWidht - 20,
                child: AutoSizeText(
                  '$title :',
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: jostFontFamily,
                      fontSize: size.bigButtonTextSize,
                      color: skinColorWhite),
                ),
              ),
              AutoSizeText(
                details,
                maxLines: 4,
                style: TextStyle(
                    fontFamily: jostFontFamily,
                    fontWeight: FontWeight.w300,
                    fontSize: size.bigButtonTextSize,
                    color: skinColorWhite),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//delete  this when you create the WorkerModel.
class Worker {
  String name;
  String age;
  int numberOfEvents;
  Worker({
    required this.numberOfEvents,
    required this.name,
    required this.age,
  });
}
