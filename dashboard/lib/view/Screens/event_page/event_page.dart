import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/sizes.dart';
import '../../widget/event_card.dart';
import '../../widget/general_appBar.dart';
import '../../widget/general_text_style.dart';
import '../../widget/slide_drawer.dart';
import '../add_event/add_event_page.dart';

// ignore: must_be_immutable
class EventPage extends StatelessWidget {
  List<Widget> eventList = [
    EventCard(
      date: '2/2/2333',
      eventName: 'event one',
      imageName: 'assets/images/The project icon.jpg',
    ),
    EventCard(
      date: '2/2/2333',
      eventName: 'event two',
      imageName: 'assets/images/The project icon.jpg',
    ),
    EventCard(
      date: '2/2/2333',
      eventName: 'event three',
      imageName: 'assets/images/The project icon.jpg',
    ),
    EventCard(
      date: '2/2/2333',
      eventName: 'event four',
      imageName: 'assets/images/The project icon.jpg',
    ),
    EventCard(
      date: '2/2/2333',
      eventName: 'event five',
      imageName: 'assets/images/The project icon.jpg',
    ),
  ];

  EventPage({super.key});

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
              'Add new event'.tr,
              style: generalTextStyle(null),
            )),
        appBar: createAppBar(size, context, getDeviceType, 'Events'.tr),
        body: Row(
          children: [
            SlideDrawer(),
            setListOfEvents(context),
          ],
        ));
  }

  Widget setListOfEvents(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: eventList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.widthInches > 11
                ? 4
                : context.widthInches > 8.5
                    ? 3
                    : context.widthInches < 7.5
                        ? 1
                        : 2,
            childAspectRatio: 1.7,
            crossAxisSpacing: 20.0,
            mainAxisExtent: 200,
          ),
          itemBuilder: (BuildContext context, int index) {
            return eventList[index];
          }),
    );
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
