import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/view/Screens/event_page/event_controller.dart';
import 'package:dashboard/view/widget/no_internet_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/sizes.dart';
import '../../widget/event_card.dart';
import '../../widget/general_app_bar.dart';
import '../../widget/general_text_style.dart';
import '../../widget/slide_drawer.dart';
import '../add_event/add_event_page.dart';
import '../order_page/order_page.dart';

// ignore: must_be_immutable
class EventPage extends StatelessWidget {
  List<Widget> eventList = [
    EventCard(
      onPressed: () {
        Get.toNamed('/EventInformationPage');
      },
      date: '2/2/2333',
      eventName: 'event one',
      imageName: 'assets/images/The project icon.jpg',
    ),
    EventCard(
      onPressed: () {
        Get.toNamed('/EventInformationPage');
      },
      date: '2/2/2333',
      eventName: 'event two',
      imageName: 'assets/images/The project icon.jpg',
    ),
    EventCard(
      onPressed: () {
        Get.toNamed('/EventInformationPage');
      },
      date: '2/2/2333',
      eventName: 'event three',
      imageName: 'assets/images/The project icon.jpg',
    ),
    EventCard(
      onPressed: () {
        Get.toNamed('/EventInformationPage');
      },
      date: '2/2/2333',
      eventName: 'event four',
      imageName: 'assets/images/The project icon.jpg',
    ),
    EventCard(
      onPressed: () {
        Get.toNamed('/EventInformationPage');
      },
      date: '2/2/2333',
      eventName: 'event five',
      imageName: 'assets/images/The project icon.jpg',
    ),
  ];

  EventPage({super.key});
  EventController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    GetDeviceType getDeviceType = GetDeviceType();
    return Scaffold(
        drawer: context.widthInches < 6 ? SlideDrawer() : null,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showAddEventDialog(context);
          },
          label: Text(
            'Add new event'.tr,
            style: generalTextStyle(null),
          ),
        ),
        appBar: createAppBar(size, context, getDeviceType, 'Events'.tr),
        body: Row(
          children: [
            Visibility(visible: context.widthInches > 6, child: SlideDrawer()),
            Expanded(
              child: Center(
                child: GetBuilder<EventController>(
                  builder: (ctx) => controller.statuseRequest ==
                          StatuseRequest.offlinefailure
                      ? noInternetPage(size, controller)
                      : controller.statuseRequest == StatuseRequest.loading
                          ? Text("loading....".tr, style: generalTextStyle(14))
                          : whenShowTheBodyAfterLoadingAndInternet(context),
                ),
              ),
            ),
          ],
        ));
  }

  Widget whenShowTheBodyAfterLoadingAndInternet(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.size.height,
        width: Get.size.width,
        child: Column(
          children: [
            dividerWithWord(
              'Current event'.tr,
            ),
            const SizedBox(
              height: 10,
            ),
            EventCard(
                onPressed: () {
                  Get.to(OrderPage());
                },
                eventName: 'current event',
                date: 'now',
                imageName: 'assets/images/my hero acadime.jpg'),
            const SizedBox(
              height: 10,
            ),
            dividerWithWord(
              'Upcomeing events'.tr,
            ),
            const SizedBox(
              height: 10,
            ),
            setListOfEvents(context),
            const SizedBox(
              height: 10,
            ),
            dividerWithWord(
              'Old events'.tr,
            ),
            const SizedBox(
              height: 10,
            ),
            setListOfEvents(context),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget setListOfEvents(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: eventList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.widthInches > 11
                ? 4
                : context.widthInches > 8.5
                    ? 3
                    : context.widthInches < 7.5
                        ? context.widthInches < 6
                            ? 2
                            : 1
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
