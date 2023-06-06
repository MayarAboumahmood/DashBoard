import 'package:dashboard/view/widget/admin_action_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/general_app_bar.dart';

class AdminAllActionPage extends StatelessWidget {
  const AdminAllActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      appBar: createAppBar(size, context),
      body: setListOfEvents(context, size),
    );
  }

  Widget setListOfEvents(BuildContext context, Sizes size) {
    return SizedBox(
      height: Get.size.height * .999,
      width: Get.size.width * .999,
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: buildActionList(context, size).length,
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
            return buildActionList(context, size)[index];
          }),
    );
  }

  AppBar createAppBar(Sizes size, BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      title: /*'${eventList[id].name}*/
          AnimationAppBar(title: 'Admin action information'.tr),
    );
  }

  List<Widget> buildActionList(BuildContext context, Sizes size) {
    List<Widget> adminActionList = [
      adminActionCard(size, context, ' theAction', ' time', 'details'),
      adminActionCard(size, context, ' theAction', ' time', 'details'),
      adminActionCard(size, context, ' theAction', ' time', 'details'),
      adminActionCard(size, context, ' theAction', ' time', 'details'),
    ];
    return adminActionList;
  }
}
