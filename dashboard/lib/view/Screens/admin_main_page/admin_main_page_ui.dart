import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/font.dart';
import 'package:dashboard/view/Screens/setting/setting_page.dart';
import 'package:dashboard/view/widget/costum_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/slide_drawer.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  GetDeviceType getDeviceType = GetDeviceType();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      appBar: createAppBar(size, context, getDeviceType),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideDrawer(),
          Flexible(
            child: Wrap(
              runAlignment: WrapAlignment.end,
              children: wrapElementList(size),
            ),
          ),
        ],
      ),
    );
  }
}

Widget searchField(
    Sizes size, GetDeviceType getDeviceType, BuildContext context) {
  return Visibility(
    visible: getDeviceType.getDevicetype(context) == 'computer' ? true : false,
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

List<Widget> wrapElementList(Sizes size) {
  return List.generate(
    3,
    (index) => buildElement(index, size),
  );
}

Widget buildElement(int index, Sizes size) {
  switch (index) {
    case 0:
      return wrapElement(size, 'Events'.tr, 'the event is very good',
          'assets/images/Warrenty.png');
    case 1:
      return wrapElement(size, 'Workers'.tr, 'the workers is very good',
          'assets/images/Warrenty.png');
    case 2:
      return wrapElement(size, 'Statistics'.tr, 'the Statistics is very good',
          'assets/images/Warrenty.png');
    default:
      return const SizedBox();
  }
}

Widget wrapElement(Sizes size, String title, String details, String imagePath) {
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
              Text(
                title,
                style: TextStyle(
                    fontFamily: jostFontFamily,
                    fontSize: size.bigButtonTextSize,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              ),
              AutoSizeText(
                details,
                maxLines: 4,
                style: TextStyle(
                    fontFamily: jostFontFamily,
                    fontSize: size.normalButtonTextSize,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

void showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Setting(),
      );
    },
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
      'Dash Board'.tr,

      /// nees to add for translate
      style: TextStyle(
          // color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
          fontSize: size.appBarTextSize / 2,
          fontFamily: jostFontFamily,
          fontWeight: FontWeight.w100),
    ),
  );
}
