import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:dashboard/view/widget/no_internet_page.dart';
import 'package:dashboard/view/widget/slide_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../widget/admin_worker_card.dart';
import '../../widget/general_app_bar.dart';
import '../add_worker/add_worker.dart';
import 'worker_management_controller.dart';

// ignore: must_be_immutable
class WorkerManagementPage extends StatelessWidget {
  WorkerManagementPage({super.key});
  WorkerManagementController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    GetDeviceType getDeviceType = GetDeviceType();
    //need to add obx for complete a connections
    return Scaffold(
      drawer: context.widthInches < 6 ? SlideDrawer() : null,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showAddWorkerDialog(context);
        },
        label: Text(
          'Add worker'.tr,
          style: TextStyle(
            fontFamily: jostFontFamily,
          ),
        ),
      ),
      appBar:
          createAppBar(size, context, getDeviceType, 'Worker management'.tr),
      body: Row(
        children: [
          SlideDrawer(),
          GetBuilder<WorkerManagementController>(
            builder: (ctx) => controller.statuseRequest ==
                    StatuseRequest.offlinefailure
                ? noInternetPage(size, controller)
                : controller.statuseRequest == StatuseRequest.loading
                    ? Center(
                        child: Text("loading....", style: generalTextStyle(14)),
                      )
                    : whenShowTheBodyAfterLoadingAndInternet(size, context),
          ),
        ],
      ),
    );
  }

  Widget whenShowTheBodyAfterLoadingAndInternet(
      Sizes size, BuildContext context) {
    return controller.finalListData.isEmpty
        ? Center(
            child: Text(
              "No workers have been added yet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: jostFontFamily,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                fontSize: 14,
              ),
            ),
          )
        : bodyOfBage(size, context);
  }

  Widget bodyOfBage(Sizes size, BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: GridView.builder(
        itemCount: controller.finalListData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.widthInches > 11
              ? 3
              : context.widthInches > 8.5
                  ? 2
                  : 1,
          childAspectRatio: 1.7,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          mainAxisExtent: 200,
        ),
        itemBuilder: (BuildContext context, int index) {
          return adminWorkerCard(
              context,
              size,
              controller.finalListData[index].image!,
              controller.finalListData[index].firstName,
              "workerDetails",
              controller.finalListData[index].id!);
        },
      ),
    );
  }

  void showAddWorkerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: AddWorker(),
        );
      },
    );
  }
}
