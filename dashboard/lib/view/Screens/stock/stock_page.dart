// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/view/Screens/add_new_drink/add_new_drink_page.dart';
import 'package:dashboard/view/Screens/stock/stock_controller.dart';
import 'package:dashboard/view/widget/drink_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/sizes.dart';
import '../../widget/general_app_bar.dart';
import '../../widget/general_text_style.dart';
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
            Flexible(
              fit: FlexFit.tight,
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: controller.drinkList.length,
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
                        drink: controller.drinkList[index],
                        onPressed: () {
                          Get.toNamed('/DrinkInformationPage');
                        });
                  }),
            )
          ],
        ));
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
