// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';

// ignore: must_be_immutable
class ReservationCard extends StatelessWidget {
  String name;
  int numberOfCustomers;
  ReservationCard({
    Key? key,
    required this.name,
    required this.numberOfCustomers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.buttonRadius),
            color: Get.isDarkMode
                ? const Color.fromARGB(255, 54, 54, 54)
                : Colors.grey[400],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                '_customer Name: customer name',
                style: generalTextStyle(null),
              ),
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                '_number of setes: 12',
                style: generalTextStyle(null),
              ),
            ],
          )),
    );
  }
}
