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
      // backgroundColor: Get.isDarkMode?backGroundDarkColor:skinColorWhite,
      appBar: createAppBar(size, context,getDeviceType),
      body: Row(
        children: [
          SlideDrawer(),
          //  SizedBox(width: Get.size.width * .04),
          Flexible(
            child: Wrap(
              runAlignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: wrapElementList(size),
            ),
          ),
        ],
      ),
    );
  }
}

Widget searchField(Sizes size,GetDeviceType getDeviceType,BuildContext context) {
  return Visibility(
    visible: getDeviceType.getDevicetype(context)=='computer'?true:false,
    replacement: IconButton(
      icon: Icon(
          Icons.search,
          color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
        ), 
        onPressed: () {  },//take us to the search page.
    ),
    child: CostumTextField(
      labelStyle:
          TextStyle(color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      widthOnTheScreen: size.appBarTextFieldWidth,
      /*  onsaved: (value) {
          controller.email = value!;
        },*/
      hint: 'search here'.tr,
      hintStyle: TextStyle(
          fontFamily: jostFontFamily,
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      label: "search".tr,
      prefixIcon: Icon(
        Icons.search,
        color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      ),
      sucer: false,
    ),
  );
}

List<Widget> wrapElementList(Sizes size) {
  return List.generate(
    4,
    (index) => Container(
      margin: EdgeInsets.all(10),
      height: size.bigButtonHeight,
      width: size.bigButtonWidht,
      decoration: BoxDecoration(
          color: Get.isDarkMode?darkPrimaryColor:primaryColor,
          borderRadius: BorderRadius.circular(size.buttonRadius)),
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

AppBar createAppBar(Sizes size, BuildContext context,GetDeviceType getDeviceType) {
  return AppBar(
    // backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
    // elevation: 0.0,
    actions: [
      searchField(size,getDeviceType,context),
      SizedBox(
        width: Get.size.width * .01,
      ),
      IconButton(
        onPressed: () {
          showSettingsDialog(context,);
        },
        icon: Icon(Icons.settings, color: Get.isDarkMode?darkPrimaryColor:primaryColor),
      ),
    ],
    title: Text(
      'Dash Board'.tr,

      /// nees to add for translate
      style: TextStyle(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
          fontSize: size.appBarTextSize / 2,
          fontFamily: jostFontFamily,
          fontWeight: FontWeight.w100),
    ),
  );
}