// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/font.dart';
import '../../constant/sizes.dart';
import '../../constant/theme.dart';

// ignore: must_be_immutable
class EventCard extends StatelessWidget {
  String eventName;
  String date;
  String imageName;

  EventCard({
    Key? key,
    required this.eventName,
    required this.date,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Stack(
      children: [
        Positioned(
            left: 8,
            child: Container(
                height: size.smallEventCardHeight,
                width: size.smallEventCardWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.buttonRadius),
                  color: Get.isDarkMode
                      ? const Color.fromARGB(255, 54, 54, 54)
                      : Colors.grey[400],
                ),
                child: Image.asset(
                  'assets/images/The project icon.jpg',
                  fit: BoxFit.contain,
                ))),
        MaterialButton(
          onPressed: () {},
          child: Container(
            height: size.smallEventCardHeight,
            width: size.smallEventCardWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.buttonRadius),
                color: backGroundDarkColor.withOpacity(0.5)),
          ),
        ),
        Positioned(
          top: 10,
          left: 20,
          child: Column(
            children: [
              Text(
                eventName,
                style: TextStyle(
                    fontFamily: jostFontFamily,
                    fontSize: size.bigButtonTextSize,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              ),
              AutoSizeText(
                date,
                maxLines: 4,
                style: TextStyle(
                    fontFamily: jostFontFamily,
                    fontSize: size.normalButtonTextSize,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
