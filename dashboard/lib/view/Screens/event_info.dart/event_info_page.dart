import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/Screens/worker_confirm_dialog/worker_confirm_dialog.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/server_const.dart';
import '../../../constant/sizes.dart';
import '../../../constant/status_request.dart';
import '../../../constant/theme.dart';
import '../../widget/event_details_card.dart';
import '../../widget/general_app_bar.dart';
import '../../widget/general_text_style.dart';
import '../../widget/no_internet_page.dart';
import '../add_event/add_event_page.dart';
import '../edit_event/edit_event_page.dart';
import '../reservation_dialog/reservation_dialog.dart';
import 'event_info_controller.dart';

// ignore: must_be_immutable
class EventInformationPage extends StatelessWidget {
  EventInformationPage({super.key});
// GetDeviceType getDeviceType=GetDeviceType();
EventInfoController controller=Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
   
    return Scaffold(
      floatingActionButton: addFloatingActionButton(
          'Edit the event'.tr, 'Delete the event'.tr, context),
      appBar: createAppBar(size, context),
      body: GetBuilder<EventInfoController>(
        builder: (ctx) => controller.statuseRequest ==
                StatuseRequest.offlinefailure
            ? noInternetPage(size, controller)
            : controller.statuseRequest == StatuseRequest.loading
                ? Text("loading....".tr, style: generalTextStyle(14))
                : whenShowTheBodyAfterLoadingAndInternet(context,size),
      ),
    );
  }


 whenShowTheBodyAfterLoadingAndInternet (BuildContext context,Sizes size){
   
    return Column(children: [
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
          height: 10,
        ),
        dividerWithWord('event details', icon: const Icon(Icons.details)),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              itemCount: controller.model!.data.reservations.length,
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
                  mainAxisSpacing: 20),
              itemBuilder: (BuildContext context, int index) {
                return EventDetailsCard(model: controller.model!.data.reservations[index],);
              }),
        ),
      ]);
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
              showEditEventDialog(context);
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
              controller.pressDeleteEvent();
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
      iconTheme: IconThemeData(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
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
              child: controller.model!.data.event.photos.isEmpty
              ? Image.asset(
                    'assets/images/The project icon.jpg',
                    fit: BoxFit.contain,
                  ):Image.network('${ServerConstApis.loadImages}${controller.model!.data.event.photos[0].picture}', fit: BoxFit.contain,),
                 ),
        ),
      ),
    );
  }

  Widget setEventName() {
    return SizedBox(
      width: 180,
      child: AutoSizeText(
       controller.model!.data.event.title,
        minFontSize: 35,
        style: TextStyle(
            fontFamily: jostFontFamily,
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      ),
    );
  }

  Widget setEventDetailes(Sizes size, BuildContext context) {
    return SizedBox(
      width: Get.size.width * .9,
      height: context.widthInches > 8.5 ? 120 : 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                eventInfoUnit(size, context, 'Number of attandend: ', controller.model!.data.reservations.length.toString(),
                    () {
                  showReservationsDialog(context);
                }),
                Visibility(
                    visible: context.widthInches > 4.5,
                    child: eventInfoUnit(
                        size, context, 'Number of worker: ', controller.model!.data.event.workerEvents.length.toString(), () {
                      // ignore: avoid_print
                      print('${context.widthInches}context.widthInches');
                      showWorkerConfirmDialog(context);
                    })),
                Visibility(
                    visible: context.widthInches > 6.5,
                    child: eventInfoUnit(
                        size, context, 'Ticket price: '.tr, controller.model!.data.event.ticketPrice.toString(), null)),
                Visibility(
                    visible: context.widthInches > 8.5,
                    child: eventInfoUnit(size, context,
                        'Reservation benefits in S.P: '.tr,  controller.model!.data.bookingIncome.toString(), null)),
                Visibility(
                    visible: context.widthInches > 8.5,
                    child: eventInfoUnit(size, context,
                        'Bar benefits in S.P: '.tr,  controller.model!.data.ordersIncome.toString(), null)),
              ],
            ),
          ),
          SizedBox(height: Get.size.width * .01),
          Visibility(
              visible: context.widthInches < 4.5,
              child:
                  eventInfoUnit(size, context, 'Number of worker: ', '100', () {
                showWorkerConfirmDialog(context);
              })),
          SizedBox(height: Get.size.width * .01),
          Row(
            children: [
              Visibility(
                  visible: context.widthInches < 6.5,
                  child: eventInfoUnit(
                      size, context, 'Event name: by kg'.tr, '20', null)),
              Visibility(
                  visible: context.widthInches < 8.5,
                  child: eventInfoUnit(
                      size, context, 'Total benefits in S.P: '.tr, '20', null)),
            ],
          ),
          SizedBox(height: Get.size.width * .01),
        ],
      ),
    );
  }

  Widget eventInfoUnit(Sizes size, BuildContext context, String title,
      String subTitle, Function()? onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
              color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
          borderRadius: BorderRadius.circular(size.buttonRadius),
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 54, 54, 54)
              : Colors.grey[400],
        ),
        child: Column(
          children: [
            Text(
              title.tr,
              style: generalTextStyle(null),
            ),
            Text(subTitle, style: generalTextStyle(null)),
            Visibility(
              visible: title == 'Number of attandend: ' ||
                  title == 'Number of worker: ',
              child: Text('click to add...'.tr),
            )
          ],
        ),
      ),
    );
  }

  void showEditEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: EditEvent(),
        );
      },
    );
  }

  void showReservationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ReservationDialog(controller.model!.data.reservations,controller.model!.data.event.eventId),
        );
      },
    );
  }

  void showWorkerConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: WorkerConfirmDialog(controller.id),
        );
      },
    );
  }
}
