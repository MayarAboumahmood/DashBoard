import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../constant/sizes.dart';
import '../Screens/worker_event_info/worker_event_info.dart';

// ignore: must_be_immutable
class WorkerEventInfoCard extends StatelessWidget {
  EventWorker evnetWorker;
  WorkerEventInfoCard({super.key, required this.evnetWorker});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.widthInches > 5 ? 7 : 7,
          vertical: Get.size.height * .01),
      margin: EdgeInsets.symmetric(
          horizontal: context.widthInches > 5 ? 7 : 7,
          vertical: Get.size.height * .01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.buttonRadius),
        color: Get.isDarkMode
            ? const Color.fromARGB(255, 54, 54, 54)
            : Colors.grey[400],
      ),
      child: ListTile(
        leading: Text(evnetWorker.money.toString()),
        trailing: Text(evnetWorker.orderDetails),
      ),
    );
  }
}
