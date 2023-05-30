import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/sizes.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/slide_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../widget/admin_worker_card.dart';
import '../../widget/general_app_bar.dart';
import 'admin_management_controller.dart';

class AdminManagementPage extends StatelessWidget {
  AdminManagementPage({super.key});
  final controller = Get.find<AdminManagementController>();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    List<Widget> workerList = [
      adminWorkerCard(
          context,
          size,
          'assets/images/The project icon.jpg',
          'one',
          'one work at the house sense 27/7/2022  and I never nothic any problem with him.',
          0),
      adminWorkerCard(context, size, 'assets/images/The project icon.jpg',
          'two', 'two is the stubid persone ever in the world', 1),
      adminWorkerCard(context, size, 'assets/images/The project icon.jpg',
          'Sham', 'workerDetails', 2),
      adminWorkerCard(context, size, 'assets/images/The project icon.jpg',
          'Mari', 'workerDetails', 3),
    ];
    GetDeviceType getDeviceType = GetDeviceType();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          hoverColor:
              Get.isDarkMode ? darkHoverButtonColor : lightHoverButtonColor,
          onPressed: () {
            //   showAddWorkerDialog(context);
          },
          label: Text(
            'Add admin'.tr,
            style: TextStyle(
              fontFamily: jostFontFamily,
            ),
          )),
      appBar:
          createAppBar(size, context, getDeviceType, 'Admins management'.tr),
      body: Row(children: [
        SlideDrawer(),
        Flexible(
          fit: FlexFit.tight,
          child: GridView.builder(
              itemCount: workerList.length,
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
                return workerList[index];
              }),
        )
      ]),
    );
  }
}
