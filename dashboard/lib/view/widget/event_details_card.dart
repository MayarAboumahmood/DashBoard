import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';

class EventDetailsCard extends StatelessWidget {
  const EventDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return SingleChildScrollView(
      child: Container(
          // width: Get.size.width * .3,
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
                '-how take the order: worker one',
                style: generalTextStyle(null),
              ),
            ],
          )),
    );
  }
}
