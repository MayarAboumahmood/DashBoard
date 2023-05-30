// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/view/Screens/stock/stock_controller.dart';
import 'package:dashboard/view/widget/stock_card.dart';
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
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              showAddEventDialog(context);
            },
            label: Text(
              'Add new drink'.tr,
              style: generalTextStyle(null),
            )),
        appBar: createAppBar(size, context, getDeviceType, 'Stock'.tr),
        body: Row(
          children: [
            SlideDrawer(),
            Flexible(
              fit: FlexFit.tight,
              child: GridView.builder(
                  itemCount: controller.drinkList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.widthInches > 11
                        ? 3
                        : context.widthInches > 8.5
                            ? 2
                            : 1,
                    childAspectRatio: 1.7,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return StockCard(drink: controller.drinkList[index]);
                  }),
            )
          ],
        ));
  }

  void showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          // child: AddEvent(),
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