// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/font.dart';
import 'package:dashboard/view/widget/general_appBar.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/admin_worker_card.dart';
import '../../widget/slide_drawer.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  GetDeviceType getDeviceType = GetDeviceType();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    List<Worker> workerList = [
      Worker(age: '22', name: 'worker 1'),
      Worker(age: '24', name: 'worker 2'),
      Worker(age: '21', name: 'worker 3'),
      Worker(age: '31', name: 'worker 4'),
    ];

    return Scaffold(
      appBar: createAppBar(size, context, getDeviceType, 'Dash Board'),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideDrawer(),
          Flexible(
            child: Wrap(
              runAlignment: WrapAlignment.end,
              children: wrapElementList(size, context, workerList),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> wrapElementList(
    Sizes size, BuildContext context, List<Worker> workerList) {
  return List.generate(
    3,
    (index) => buildElement(index, size, context, workerList),
  );
}

Widget buildElement(
    int index, Sizes size, BuildContext context, List<Worker> workerList) {
  switch (index) {
    case 0:
      return setWorkersHomePageCard(size, context, workerList);
    case 1:
      return homePageCard(
          size, 'total number of events'.tr, '9', 'assets/images/Warrenty.png');
    case 2:
      return homePageCard(size, 'total number of customer'.tr, '723',
          'assets/images/Warrenty.png');
    default:
      return const SizedBox();
  }
}

Widget setWorkersHomePageCard(
    Sizes size, BuildContext context, List<Worker> workerList) {
  return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(10),
      width: size.bigButtonWidht,
      height: size.bigButtonHeight * 1.5,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
          borderRadius: BorderRadius.circular(size.buttonRadius)),
      child: ListView.builder(
        itemCount: workerList.length * 2,
        prototypeItem: ListTile(
          title: Text(
            'workerList.first',
            style: generalTextStyle(null),
          ),
        ),
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider(
              color: skinColorWhite,
              height: 0,
            );
          }
          final itemIndex = index ~/ 2;

          return ListTile(
            title: Text(workerList[itemIndex].name),
          );
        },
      ));
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
            child: Image.asset(imagePath)),
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
  Worker({
    required this.name,
    required this.age,
  });
}
