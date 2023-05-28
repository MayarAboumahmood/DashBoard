// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/view/widget/general_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/event_card.dart';
import '../../widget/general_text_style.dart';

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
        setWorkerDetailes(),
        const SizedBox(
          height: 30,
        ),
        setListOfEvents(
            context), //when the admin click on the event card it should open as a dyalog adn appear what did the user do in the event.
      ]),
    );
  }

  Widget setWorkerDetailes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('age: /*{worker[id].age}*/', style: generalTextStyle(30)),
        Text('gender: /*{worker[id].gender}*/', style: generalTextStyle(30)),
        Text('salery: /*{worker[id].salery}*/', style: generalTextStyle(30)),
      ],
    );
  }

  Widget setWorkerName() {
    return Text(
      'worker name' /*eventList.getWorker(worker.id).name */,
      style: TextStyle(
          fontFamily: jostFontFamily,
          fontSize: 40,
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
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

  AppBar createAppBar(Sizes size, BuildContext context) {
    return AppBar(
      title: /*'${eventList[id].name}*/ AnimationAppBar(title: 'information'),
    );
  }
}
