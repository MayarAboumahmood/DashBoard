import 'package:dashboard/view/widget/general_card.dart';
import 'package:dashboard/view/widget/slide_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../widget/general_appBar.dart';
import '../add_worker/add_worker.dart';

// ignore: must_be_immutable
class WorkerManagementPage extends StatelessWidget {
  WorkerManagementPage({super.key});
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    List<Widget> workerList = [
      generalCard(
          context,
          size,
          'assets/images/The project icon.jpg',
          'one',
          'one work at the house sense 27/7/2022  and I never nothic any problem with him.',
          0),
      generalCard(context, size, 'assets/images/The project icon.jpg', 'two',
          'two is the stubid persone ever in the world', 1),
      generalCard(context, size, 'assets/images/The project icon.jpg', 'Sham',
          'workerDetails', 2),
      generalCard(context, size, 'assets/images/The project icon.jpg', 'Mari',
          'workerDetails', 3),
    ];
    GetDeviceType getDeviceType = GetDeviceType();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showAddWorkerDialog(context);
          },
          label: Text(
            'Add worker'.tr,
            style: TextStyle(
              fontFamily: jostFontFamily,
            ),
          )),
      appBar: createAppBar(size, context, getDeviceType,'Worker management'),///add for translate 
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
