// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/Screens/worker_event_info/worker_event_info.dart';
import 'package:dashboard/view/widget/dialog.dart';
import 'package:dashboard/view/widget/general_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/server_const.dart';
import '../../../constant/sizes.dart';
import '../../../constant/status_request.dart';
import '../../../constant/theme.dart';
import '../../../data/Models/worker_information.dart';
import '../../widget/event_card.dart';
import '../../widget/general_text_style.dart';
import '../../widget/no_internet_page.dart';
import 'worker_inforamtion_controller.dart';

// ignore: must_be_immutable
class WorkerInfoPage extends StatelessWidget {
  WorkerInformationController controller = Get.find();
  WorkerInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
        floatingActionButton:
            addFloatinActionButton('delete this worker', context),
        appBar: createAppBar(size, context),
        body: GetBuilder<WorkerInformationController>(
          builder: (ctx) =>
              controller.statuseRequest == StatuseRequest.offlinefailure
                  ? noInternetPage(size, controller)
                  : controller.statuseRequest == StatuseRequest.loading
                      ? Text("loading....".tr, style: generalTextStyle(14))
                      : Column(children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              setWorkerImage(),
                              setWorkerName(),
                            ],
                          ),
                          setWorkerDetailes(size, context),
                          const SizedBox(
                            height: 30,
                          ),
                          setListOfEvents(
                              context), //when the admin click on the event card it should open as a dyalog adn appear what did the user do in the event.
                        ]),
        ));
  }

  Widget addFloatinActionButton(String title, BuildContext context) {
    return FloatingActionButton.extended(
        hoverColor: Get.isDarkMode ? Colors.red[600] : Colors.red[500],
        onPressed: () {
          // showAddWorkerDialog(context);
          controller.onPressDeleteWorker();
        },
        label: Text(
          title.tr,
          style: generalTextStyle(null),
        ));
  }

  void showAddWorkerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: MyDialogWidget(errorMessage: "error", title: "title"),
        );
      },
    );
  }

  Widget setWorkerDetailes(Sizes size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            AutoSizeText('Email: ${controller.finalData!.email}',
                style: generalTextStyle(25)),
            const SizedBox(
              width: 30,
            ),
            Visibility(
              visible: context.widthInches > 8,
              child: AutoSizeText('Phone: ${controller.finalData!.numberPhone}',
                  style: generalTextStyle(25)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Visibility(
            visible: context.widthInches < 8,
            child: AutoSizeText('Email: ${controller.finalData!.email}',
                style: generalTextStyle(25)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Visibility(
            visible: context.widthInches < 12,
            child: Visibility(
              visible: context.widthInches > 8,
              child: AutoSizeText('Phone: ${controller.finalData!.numberPhone}',
                  style: generalTextStyle(25)),
            ),
          ),
        ),
      ],
    );
  }

  Widget setWorkerName() {
    return Text(
      controller.model.firstName + controller.model.lastName,
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
        child: SizedBox(
            height: 210,
            width: 210,
            child: controller.model.image == ''
                ? CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    backgroundImage:
                        const AssetImage('assets/images/The project icon.jpg'),
                    child: const SizedBox())
                : CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    backgroundImage: NetworkImage(
                        "${ServerConstApis.loadImages}${controller.model.image}"),
                    child: const SizedBox(),
                  )),
      ),
    );
  }

  Widget setListOfEvents(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: controller.finalData!.events!.length,
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
            return EventCard(
              date: controller.finalData!.events![index].beginDate,
              eventName: controller.finalData!.events![index].title,
              imageName: controller.finalData!.events![index].image,
              onPressed: () {
                print(" press");
                showWorkerEventInfoDialog(context,
                    controller.finalData!.events![index].actionsForEvent);
              },
            );
          }),
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

  void showWorkerEventInfoDialog(BuildContext context,
      List<AllActionsModelForWorker> allActionsModelForWorker) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: WorkerEventInfo(workerEvents: allActionsModelForWorker),
        );
      },
    );
  }
}
