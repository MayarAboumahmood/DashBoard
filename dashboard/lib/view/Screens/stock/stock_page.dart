// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/main.dart';
import 'package:dashboard/view/Screens/add_new_drink/add_new_drink_page.dart';
import 'package:dashboard/view/Screens/stock/stock_controller.dart';
import 'package:dashboard/view/widget/drink_card.dart';
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
import '../../widget/slide_drawer.dart';

// ignore: must_be_immutable
class StockPage extends StatelessWidget {
  StockPage({super.key});
  StockController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    GetDeviceType getDeviceType = GetDeviceType();
    return Scaffold(
      drawer: context.widthInches < 6 ? SlideDrawer() : null,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showAddDrinkDialog(context);
          },
          label: Text(
            'Add new drink'.tr,
            style: generalTextStyle(null),
          )),
      appBar: createAppBar(size, context, getDeviceType, 'Stock'.tr),
      body: Row(
        children: [
          Visibility(visible: context.widthInches > 6, child: SlideDrawer()),
          Expanded(
            child: Center(
              child: GetBuilder<StockController>(
                builder: (ctx) => controller.statuseRequest ==
                        StatuseRequest.offlinefailure
                    ? noInternetPage(size, controller)
                    : controller.statuseRequest == StatuseRequest.loading
                        ? Center(
                            child: Text("loading....".tr,
                                style: generalTextStyle(14)),
                          )
                        : whenShowTheBodyAfterLoadingAndInternet(size, context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget whenShowTheBodyAfterLoadingAndInternet(
      Sizes size, BuildContext context) {
    return controller.finalListData.isEmpty
        ? Center(
            child: Text(
              "No drinks have been added yet".tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: jostFontFamily,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                fontSize: 14,
              ),
            ),
          )
        : bodyOfBage(context);
  }

  Widget bodyOfBage(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: controller.finalListData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.widthInches > 12.5
              ? 4
              : context.widthInches > 10
                  ? 3
                  : context.widthInches < 7.5
                      ? context.widthInches < 6
                          ? 2
                          : 1
                      : 2,
          childAspectRatio: 1.7,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          mainAxisExtent: 210,
        ),
        itemBuilder: (BuildContext context, int index) {
          return DrinkCard(
            drink: controller.finalListData[index],
            onPressed: () {
              prefService.createString(
                  'drink_id', controller.finalListData[index].toString());
              Get.toNamed('/DrinkInformationPage',arguments: controller.finalListData[index]);
            },
          );
        },
      ),
    );
  }

  void showAddDrinkDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: AddNewDrink(),
        );
      },
    );
  }
}

class Drink {
  String name;
  double unitPriceInSP;
  String disecraption;
  double amountByLeter;
  double howMuchToMakeAUnit;
  Drink({
    required this.name,
    required this.unitPriceInSP,
    required this.disecraption,
    required this.amountByLeter,
    required this.howMuchToMakeAUnit,
  });
}
