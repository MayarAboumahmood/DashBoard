// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/font.dart';
import 'package:dashboard/view/widget/general_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/sizes.dart';
import '../../../constant/status_request.dart';
import '../../../constant/theme.dart';
import '../../widget/general_text_style.dart';
import '../../widget/no_internet_page.dart';
import '../../widget/slide_drawer.dart';
import 'admin_main_page_controller.dart';

class Home extends StatelessWidget {
  final SlideDrawerController slideDrawerController = Get.find();
  final HomeController controller = Get.find();
  Home({super.key});
  final GetDeviceType getDeviceType = GetDeviceType();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);

    return Scaffold(
        drawer: context.widthInches < 6 ? SlideDrawer() : null,
        appBar: createAppBar(size, context, getDeviceType, 'Home page'.tr),
        body: GetBuilder<HomeController>(
            builder: (ctx) => controller.statuseRequest ==
                    StatuseRequest.offlinefailure
                ? noInternetPage(size, controller)
                : controller.statuseRequest == StatuseRequest.loading
                    ? Center(
                        child:
                            Text("loading....".tr, style: generalTextStyle(14)),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                              visible: context.widthInches > 6,
                              child: SlideDrawer()),
                          Flexible(
                            child: Wrap(
                                runAlignment: WrapAlignment.end,
                                children: [
                                  homePageCard(
                                      size,
                                      'Total number of customer'.tr,
                                      controller.finalListData.customers
                                          .toString(),
                                      'assets/images/Customers.png'),
                                  homePageCard(
                                      size,
                                      'Number of drinks'.tr,
                                      controller.finalListData.drinks
                                          .toString(),
                                      'assets/images/drinks.png'),
                                  homePageCard(
                                      size,
                                      'Upcoming event number'.tr,
                                      controller.finalListData.upcomingEvents
                                          .toString(),
                                      'assets/images/concert.png'), //to do
                                  homePageCard(
                                      size,
                                      'Past events'.tr,
                                      controller.finalListData.pastEvents
                                          .toString(),
                                      'assets/images/concert.png'), //to do
                                  homePageCard(
                                      size,
                                      'Number of workers'.tr,
                                      controller.finalListData.workers
                                          .toString(),
                                      'assets/images/Workers.png'), //to do

                                  homePageCard(
                                      size,
                                      'Number of admins'.tr,
                                      controller.finalListData.admins
                                          .toString(),
                                      'assets/images/Admins.png'), //to do
                                  homePageCard(
                                      size,
                                      'Total cost'.tr,
                                      controller.finalListData.totalCost
                                          .toString(),
                                      'assets/images/stack_of_money.png'), //to do
                                  homePageCard(
                                      size,
                                      'The proceeds'.tr,
                                      controller.finalListData.proceeds
                                          .toString(),
                                      'assets/images/one_package_of_money.png'), //to do
                                  homePageCard(
                                      size,
                                      'The profit'.tr,
                                      controller.finalListData.profit
                                          .toString(),
                                      'assets/images/one_package_of_money.png'), //to do
                                ]),
                          ),
                        ],
                      )));
  }
}

Widget homePageCard(
    Sizes size, String title, String details, String imagePath) {
  return SizedBox(
    height: size.bigButtonHeight + 10,
    width: size.bigButtonWidht - 10,
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
        Positioned(
          top: 20,
          child: SizedBox(
            height: size.bigButtonHeight - 20,
            width: size.bigButtonWidht - 10,
            child: Image.asset(imagePath),
          ),
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
