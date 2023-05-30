import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/general_app_bar.dart';
import '../../widget/general_text_style.dart';

class EventInformationPage extends StatelessWidget {
  const EventInformationPage({super.key});
// GetDeviceType getDeviceType=GetDeviceType();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);

    return Scaffold(
      appBar: createAppBar(size, context),
      body: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setEventImage(size),
            setEventName(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        setEventDetailes(size, context),
        const SizedBox(
          height: 30,
        ),
      ]),
    );
  }

  AppBar createAppBar(Sizes size, BuildContext context) {
    return AppBar(
      title: /*'${eventList[id].name}*/
          AnimationAppBar(title: 'information'.tr),
    );
  }

  Widget setEventImage(Sizes size) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.buttonRadius),
          border: Border.all(
              width: 2,
              color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
        ),
        child: ClipRRect(
          child: SizedBox(
              height: 150,
              child: Image.asset('assets/images/The project icon.jpg')),
        ),
      ),
    );
  }

  Widget setEventName() {
    return Text(
      'Event name' /*eventList.getEvent(Event.id).name */,
      style: TextStyle(
          fontFamily: jostFontFamily,
          fontSize: 40,
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
    );
  }

  Widget setEventDetailes(Sizes size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            AutoSizeText(
                'Number of attandend: /*{event[id].numberOfAttandend}*/',
                style: generalTextStyle(22)),
            const SizedBox(
              width: 30,
            ),
            Visibility(
              visible: context.widthInches > 10,
              child: AutoSizeText('Event name: /*{event[id].name}*/',
                  style: generalTextStyle(22)),
            ),
            const SizedBox(
              width: 30,
            ),
            Visibility(
              visible: context.widthInches > 14,
              child: AutoSizeText('Total benefits: /*{event[id].benefits}*/',
                  style: generalTextStyle(22)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Visibility(
            visible: context.widthInches < 10,
            child: AutoSizeText('Event name: /*{event[id].name}*/',
                style: generalTextStyle(25)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Visibility(
            visible: context.widthInches < 14,
            child: AutoSizeText('Total benefits: /*{event[id].benefits}*/',
                style: generalTextStyle(25)),
          ),
        ),
      ],
    );
  }
}
