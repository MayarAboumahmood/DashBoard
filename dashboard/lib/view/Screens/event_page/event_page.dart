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

// ignore: must_be_immutable
class EventPage extends StatelessWidget {
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
            Visibility(
              replacement: const SizedBox(),
              visible: controller.nowList.isNotEmpty,
              child: Column(
                children: [
                  dividerWithWord(
                    'Current event'.tr,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
                replacement: const SizedBox(),
                visible: controller.nowList.isNotEmpty,
                child: setListNowOfEvents(context)),
            Visibility(
              replacement: const SizedBox(),
              visible: controller.upComingList.isNotEmpty,
              child: Column(
                children: [
                  dividerWithWord(
                    'Upcomeing events'.tr,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Visibility(
                replacement: const SizedBox(),
                visible: controller.upComingList.isNotEmpty,
                child: setUPcomingListOfEvents(context)),
            const SizedBox(
              height: 10,
            ),
            Visibility(
                replacement: const SizedBox(),
                visible: controller.pastList.isNotEmpty,
                child: Column(
                  children: [
                    dividerWithWord(
                      'Old events'.tr,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
            Visibility(
                replacement: const SizedBox(),
                visible: controller.pastList.isNotEmpty,
                child: setListPastOfEvents(context)),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget setListNowOfEvents(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: controller.nowList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.widthInches > 11
                ? 4
                : context.widthInches > 8.5
                    ? 3
                    : context.widthInches < 7.5
                        ? context.widthInches < 6 && context.widthInches > 4.5
                            ? 2
                            : 1
                        : 2,
            childAspectRatio: 1.7,
            crossAxisSpacing: 20.0,
            mainAxisExtent: 200,
          ),
          itemBuilder: (BuildContext context, int index) {
            return EventCard(
                onPressed: () {
                  Get.toNamed('/EventInformationPage',
                      arguments: ['Current', controller.nowList[index].id]);
                },
                eventName: controller.nowList[index].title,
                date: controller.nowList[index].beginDate,
                imageName: controller.nowList[index].image);
          }),
    );
  }

  Widget setListPastOfEvents(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: controller.pastList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.widthInches > 11
                ? 4
                : context.widthInches > 8.5
                    ? 3
                    : context.widthInches < 7.5
                        ? context.widthInches < 6 && context.widthInches > 4.5
                            ? 2
                            : 1
                        : 2,
            childAspectRatio: 1.7,
            crossAxisSpacing: 20.0,
            mainAxisExtent: 200,
          ),
          itemBuilder: (BuildContext context, int index) {
            return EventCard(
                onPressed: () {
                  Get.toNamed('/EventInformationPage',arguments: ["past",controller.pastList[index].id]);
                },
                eventName: controller.pastList[index].title,
                date: controller.pastList[index].beginDate,
                imageName: controller.pastList[index].image);
          }),
    );
  }

  Widget setUPcomingListOfEvents(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: controller.upComingList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.widthInches > 11
                ? 4
                : context.widthInches > 8.5
                    ? 3
                    : context.widthInches < 7.5
                        ? context.widthInches < 6 && context.widthInches > 4.5
                            ? 2
                            : 1
                        : 2,
            childAspectRatio: 1.7,
            crossAxisSpacing: 20.0,
            mainAxisExtent: 200,
          ),
          itemBuilder: (BuildContext context, int index) {
            return EventCard(
                onPressed: () {
                  Get.toNamed('/EventInformationPage',arguments: ["upComing",controller.upComingList[index].id]);
                },
                eventName: controller.upComingList[index].title,
                date: controller.upComingList[index].beginDate,
                imageName: controller.upComingList[index].image);
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
