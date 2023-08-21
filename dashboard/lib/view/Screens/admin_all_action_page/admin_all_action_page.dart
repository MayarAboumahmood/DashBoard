import 'package:dashboard/view/widget/admin_action_card.dart';
import 'package:dashboard/view/widget/costum_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/status_request.dart';
import '../../../constant/theme.dart';
import '../../widget/general_app_bar.dart';
import '../../widget/general_text_style.dart';
import '../../widget/no_internet_page.dart';
import 'admin_all_action_controller.dart';

// ignore: must_be_immutable
class AdminAllActionPage extends StatelessWidget {
  AdminAllActionPage({super.key});
  AllActionController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
        appBar: createAppBar(size, context),
        body: GetBuilder<AllActionController>(
          builder: (ctx) =>
              controller.statuseRequest == StatuseRequest.offlinefailure
                  ? noInternetPage(size, controller)
                  : controller.statuseRequest == StatuseRequest.loading
                      ? Text("loading....".tr, style: generalTextStyle(14))
                      : setListOfEvents(context, size),
        ));
  }

  Widget setListOfEvents(BuildContext context, Sizes size) {
    return SizedBox(
      height: Get.size.height * .999,
      width: Get.size.width * .999,
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: controller.model.length,
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
            return adminActionCard(size, context, controller.model[index]);
          }),
    );
  }

  AppBar createAppBar(Sizes size, BuildContext context) {
    return AppBar(
      actions: [
        searchField(
          size,
          GetDeviceType(),
          context,
        ),
      ],
      iconTheme: IconThemeData(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      title: AnimationAppBar(title: 'Admin action information'.tr),
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
        onPressed: () {
          Get.toNamed('/SearchPage');
        }, //take us to the search page.
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
              ),
              sucer: false,
            )),
      ),
    );
  }
}
