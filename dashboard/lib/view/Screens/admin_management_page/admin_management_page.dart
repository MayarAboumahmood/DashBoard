import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/sizes.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/view/widget/no_internet_page.dart';
import 'package:dashboard/view/widget/slide_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../widget/admin_worker_card.dart';
import '../../widget/general_app_bar.dart';
import '../../widget/general_text_style.dart';
import '../add_admin/add_admin.dart';
import 'admin_management_controller.dart';

class AdminManagementPage extends StatelessWidget {
  AdminManagementPage({super.key});
  final controller = Get.find<AdminManagementController>();

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);

    GetDeviceType getDeviceType = GetDeviceType();
    return Scaffold(
      drawer: context.widthInches < 6 ? SlideDrawer() : null,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showAddAdminDialog(context);
        },
        label: Text(
          'Add admin'.tr,
          style: TextStyle(
            fontFamily: jostFontFamily,
          ),
        ),
      ),
      appBar:
          createAppBar(size, context, getDeviceType, 'Admins management'.tr),
      body: Row(
        children: [
          Visibility(visible: context.widthInches > 6, child: SlideDrawer()),
          Expanded(
              child: Center(
            child: GetBuilder<AdminManagementController>(
              builder: (ctx) => controller.statuseRequest ==
                      StatuseRequest.offlinefailure
                  ? noInternetPage(size, controller)
                  : controller.statuseRequest == StatuseRequest.loading
                      ? Center(
                          child: Text("loading....".tr,
                              style: generalTextStyle(14)),
                        )
                      : whenShowTheBodyAfterLoadingAndInternet(size, context),
            ),
          ))
        ],
      ),
    );
  }

  Widget whenShowTheBodyAfterLoadingAndInternet(
      Sizes size, BuildContext context) {
    return GridView.builder(
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
        return adminCard(context, size, controller.finalListData[index].name,
            "workerDetails", controller.finalListData[index].id!);
      },
    );
  }

  void showAddAdminDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: AddAdmin(),
        );
      },
    );
  }
}
