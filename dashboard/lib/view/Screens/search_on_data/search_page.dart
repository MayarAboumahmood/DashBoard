import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/admin_action_card.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/sizes.dart';
import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final GeneralSearchController controller = Get.put(GeneralSearchController());
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      appBar: createAppBar(size, controller),
      body: setListOfEvents(context, size),
    );
  }

  Widget setListOfEvents(BuildContext context, Sizes size) {
    return SizedBox(
      height: Get.size.height * .999,
      width: Get.size.width * .999,
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: controller.searchModel.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.widthInches > 11
                ? 4
                : context.widthInches > 8.5
                    ? 3
                    : context.widthInches < 7.5
                        ? 1
                        : 2,
            childAspectRatio: 1.7,
            crossAxisSpacing: 20.0,
            mainAxisExtent: 200,
          ),
          itemBuilder: (BuildContext context, int index) {
            return adminActionCard(
                size, context, controller.searchModel[index]);
          }),
    );
  }

  PreferredSizeWidget? createAppBar(
      Sizes size, GeneralSearchController controller) {
    return AppBar(
      iconTheme: IconThemeData(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      backgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      actions: [
        SizedBox(
          width: Get.size.width * .9,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'search'.tr, // Set the hint text to "search"
                hintStyle: TextStyle(
                    color: Get.isDarkMode
                        ? skinColorWhite
                        : backGroundDarkColor), // Set the hint text color to white
              ),
              style: generalTextStyle(null),
              onChanged: (text) {
                controller.actionSearch(text);
              },
            ),
          ),
        )
      ],
    );
  }
}
