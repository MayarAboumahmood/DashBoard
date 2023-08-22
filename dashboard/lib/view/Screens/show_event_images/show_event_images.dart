import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/server_const.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/data/Models/Event_info_model.dart';
import 'package:dashboard/view/Screens/event_page/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import '../../../constant/sizes.dart';
import '../../../main.dart';

// ignore: must_be_immutable
class ShowImageEvent extends StatelessWidget {
  ShowImageEvent({super.key,required this.imageList});
EventController eventController=Get.find();
List<Photo> imageList;
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Container(
        height: Get.size.height * .9,
        width: context.widthInches > 5.5 ? 400 : Get.size.width * .85,
        color: Get.isDarkMode ? Colors.black54 : skinColorWhite,
        child: SingleChildScrollView(
          child: Column(children: [
            createAppBar(size),
            SizedBox(
              height: sharedPreferences!.getString('lang') == 'en'
                  ? Get.size.height * .02
                  : Get.size.height * .01,
            ),
            SizedBox(height: 600,child: ListView.builder(itemCount:  imageList.length,itemBuilder: (context,index){
             //to do ...................
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 20),
               child: Image.network(ServerConstApis.loadImages+ imageList[index].picture),
             ); 
            }),)
             ]),
        ));
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
          child: Text('Event images'.tr,
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
