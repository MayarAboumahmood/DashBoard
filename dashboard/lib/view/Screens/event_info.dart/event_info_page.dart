import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/general_app_bar.dart';
import '../../widget/general_text_style.dart';
import '../add_event/add_event_page.dart';

class EventInformationPage extends StatelessWidget {
  const EventInformationPage({super.key});
// GetDeviceType getDeviceType=GetDeviceType();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);

    return Scaffold(
      floatingActionButton: addFloatingActionButton(
          'Edite the event'.tr, 'Delete the event'.tr, context),
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
          height: 20,
        ),
        dividerWithWord('event details', icon: const Icon(Icons.details))
      ]),
    );
  }

  Widget addFloatingActionButton(
      String firstTitle, String secondTitle, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
            heroTag: firstTitle,
            hoverColor:
                Get.isDarkMode ? darkHoverButtonColor : lightHoverButtonColor,
            onPressed: () {
              showAddEventDialog(context);
            },
            label: Text(
              firstTitle.tr,
              style: generalTextStyle(null),
            )),
        const SizedBox(height: 10),
        FloatingActionButton.extended(
            heroTag: secondTitle,
            hoverColor: Get.isDarkMode ? Colors.red[600] : Colors.red[500],
            onPressed: () {
              //open dialog than delete this drink
            },
            label: Text(
              secondTitle.tr,
              style: generalTextStyle(null),
            )),
      ],
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
            eventInfoUnit(size, context, 'Number of attandend: '.tr, '100'),
            eventInfoUnit(size, context, 'Event name: '.tr, 'event one'),
            Visibility(
                visible: context.widthInches > 6,
                child: eventInfoUnit(
                    size, context, 'total benefits in S.P: '.tr, '2000000')),
          ],
        ),
        SizedBox(height: Get.size.width * .01),
        Visibility(
            visible: context.widthInches < 6,
            child: eventInfoUnit(
                size, context, 'Available quantity by kg'.tr, '20')),
      ],
    );
  }

  Widget eventInfoUnit(
      Sizes size, BuildContext context, String title, String subTitle) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.size.width * .01),
        child: Container(
          width: Get.size.width * .3,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.buttonRadius),
            color: Get.isDarkMode
                ? const Color.fromARGB(255, 54, 54, 54)
                : Colors.grey[400],
          ),
          child: ListTile(
            title: Text(
              '$title :',
              style: generalTextStyle(null),
            ),
            subtitle: Text(subTitle, style: generalTextStyle(null)),
          ),
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
          child: AddEvent(),
        );
      },
    );
  }
}
