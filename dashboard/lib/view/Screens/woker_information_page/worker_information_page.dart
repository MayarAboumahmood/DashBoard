// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/event_card.dart';

// ignore: must_be_immutable
class WorkerInfoPage extends StatelessWidget {
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
  int id;
  WorkerInfoPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      appBar: createAppBar(size, context),
      body: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setWorkerImage(),
            setWorkerName(),
          ],
        ),
        //to do add age gender and how much he/she make in the day.
        setListOfEvents(
            context), //when the admin click on the event card it should open as a dyalog adn appear what did the user do in the event.
      ]),
    );
  }

  Widget setWorkerName() {
    return Text(
      'worker name' /*eventList.getWorker(worker.id).name */,
      style: TextStyle(
          fontFamily: jostFontFamily,
          fontSize: 40,
          color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
    );
  }

  Widget setWorkerImage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 2,
              color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
        ),
        child: ClipOval(
          child: SizedBox(
              height: 150,
              child: Image.asset('assets/images/The project icon.jpg')),
        ),
      ),
    );
  }

  Widget setListOfEvents(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: eventList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.widthInches > 11
                ? 4
                : context.widthInches > 8.5
                    ? 3
                    : 2,
            childAspectRatio: 1.7,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            mainAxisExtent: 200,
          ),
          itemBuilder: (BuildContext context, int index) {
            return eventList[index];
          }),
    );
  }

  AppBar createAppBar(Sizes size, BuildContext context) {
    return AppBar(
      title: Text(
        /*'${eventList[id].name}*/ 'information',
        style: TextStyle(
            fontSize: size.appBarTextSize / 2,
            fontFamily: jostFontFamily,
            fontWeight: FontWeight.w100),
      ),
    );
  }
}
