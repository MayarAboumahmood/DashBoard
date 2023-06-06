// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';
import '../Screens/select_worker/select_worker.dart';

// ignore: must_be_immutable
class EventDetailsCard extends StatelessWidget {
  bool? theOrderIsFulfilled;
  EventDetailsCard({
    Key? key,
    this.theOrderIsFulfilled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.buttonRadius),
            color: Get.isDarkMode
                ? const Color.fromARGB(255, 54, 54, 54)
                : Colors.grey[400],
          ),
          child: Column(
            children: [
              Text(
                '-desecribtion of the order: desecribtion desecribtion desecribtion desecribtion desecribtion desecribtion desecribtion ',
                style: generalTextStyle(null),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '-money: 100 S.P',
                style: generalTextStyle(null),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '-who take the order: worker one',
                style: generalTextStyle(null),
              ),
              const SizedBox(
                height: 5,
              ),
              Visibility(
                visible:
                    theOrderIsFulfilled == null ? false : !theOrderIsFulfilled!,
                child: TextButton(
                    onPressed: () {
                      showSelectWrokerDialog(context);
                    },
                    child: Text(
                      'change the worker'.tr,
                      style: generalTextStyle(20),
                    )),
              )
            ],
          )),
    );
  }

  void showSelectWrokerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: const SelectWorker(),
        );
      },
    );
  }
}
