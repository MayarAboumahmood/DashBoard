// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/divider_with_word.dart';
import '../../widget/event_details_card.dart';
import '../../widget/general_app_bar.dart';

// ignore: must_be_immutable
class OrderPage extends StatelessWidget {
  List<EventDetailsCard> fulfilledOrdersList = [
    EventDetailsCard(theOrderIsFulfilled: false),
    EventDetailsCard(theOrderIsFulfilled: false),
    EventDetailsCard(theOrderIsFulfilled: true),
    EventDetailsCard(),
    EventDetailsCard(),
  ];
  OrderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
        appBar: createAppBar(size, context),
        body: SingleChildScrollView(
            child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: Column(
            children: [
              dividerWithWord(
                'Fulfilled orders'.tr,
              ),
              const SizedBox(
                height: 10,
              ),
              fulfilledOrders(context),
              const SizedBox(
                height: 10,
              ),
              dividerWithWord(
                'unfulfilled orders'.tr,
              ),
              const SizedBox(
                height: 10,
              ),
              unfulfilledOrders(context),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )));
  }

  Widget fulfilledOrders(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: fulfilledOrdersList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.widthInches > 11
                  ? 4
                  : context.widthInches > 8.5
                      ? 3
                      : context.widthInches < 7.5
                          ? context.widthInches < 6
                              ? 2
                              : 1
                          : 2,
              childAspectRatio: 1.7,
              crossAxisSpacing: 20.0,
              mainAxisExtent: 200,
              mainAxisSpacing: 20),
          itemBuilder: (BuildContext context, int index) {
            return fulfilledOrdersList[index];
          }),
    );
  }

  Widget unfulfilledOrders(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: fulfilledOrdersList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.widthInches > 11
                  ? 4
                  : context.widthInches > 8.5
                      ? 3
                      : context.widthInches < 7.5
                          ? context.widthInches < 6
                              ? 2
                              : 1
                          : 2,
              childAspectRatio: 1.7,
              crossAxisSpacing: 20.0,
              mainAxisExtent: 200,
              mainAxisSpacing: 20),
          itemBuilder: (BuildContext context, int index) {
            return fulfilledOrdersList[index];
          }),
    );
  }

  AppBar createAppBar(Sizes size, BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      title: /*'${eventList[id].name}*/
          AnimationAppBar(title: 'Current event information'.tr),
    );
  }
}
