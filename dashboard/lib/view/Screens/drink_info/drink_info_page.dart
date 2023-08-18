import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import '../../../constant/font.dart';
import '../../../constant/server_const.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/general_app_bar.dart';
import '../../widget/update_drink.dart';
import 'drinke_info_controller.dart';

// ignore: must_be_immutable
class DrinkInformationPage extends StatelessWidget {
  DrinkInformationPage({super.key});
  DrinkInfoController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);

    return Scaffold(
      floatingActionButton: addFloatinActionButton(
          context, 'Edite the drink'.tr, 'Delete the drink'.tr),
      appBar: createAppBar(size, context),
      body: Column(children: [
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
        setDrinkDetailes(size, context),
        const SizedBox(
          height: 30,
        ),
      ]),
    );
  }

  Widget addFloatinActionButton(
      BuildContext context, String firstTitle, String secondTitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
            heroTag: firstTitle,
            hoverColor:
                Get.isDarkMode ? darkHoverButtonColor : lightHoverButtonColor,
            onPressed: () {
              showAddDrinkDialog(context);
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
              controller.onDeleteDone();
            },
            label: Text(
              secondTitle.tr,
              style: generalTextStyle(null),
            )),
      ],
    );
  }

  Widget setDrinkDetailes(Sizes size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            drinkInfoUnit(size, context, 'Unit price S.P'.tr,
                controller.model.price.toString()),
            drinkInfoUnit(size, context, 'Bottle price by S.P'.tr,
                controller.model.cost.toString()),
            Visibility(
                visible: context.widthInches > 8,
                child: drinkInfoUnit(
                    size,
                    context,
                    'Available quantity by kg'.tr,
                    controller.model.quantity.toString())),
          ],
        ),
        SizedBox(height: Get.size.width * .01),
        Visibility(
            visible: context.widthInches < 8,
            child: drinkInfoUnit(size, context, 'Available quantity by kg'.tr,
                controller.model.quantity.toString())),
      ],
    );
  }

  Widget drinkInfoUnit(
      Sizes size, BuildContext context, String title, String subTitle) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          width: Get.size.width * .3,
          // height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.buttonRadius),
            color: Get.isDarkMode
                ? const Color.fromARGB(255, 54, 54, 54)
                : Colors.grey[400],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            title: Text(
              title,
              style: generalTextStyle(null),
            ),
            subtitle: Text(subTitle, style: generalTextStyle(null)),
          ),
        ));
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
            child: controller.model.image == ''
                ? Image.asset('assets/images/The project icon.jpg',
                    fit: BoxFit.fill)
                : Image.network(
                    "${ServerConstApis.loadImages}${controller.model.image}",
                    fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Widget setEventName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: AutoSizeText(
            controller.model.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            minFontSize: 30,
            style: TextStyle(
                fontFamily: jostFontFamily,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
          ),
        ),
        SizedBox(
          width: 150,
          child: AutoSizeText(
            controller.model.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            minFontSize: 20,
            style: TextStyle(
                fontFamily: jostFontFamily,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
          ),
        ),
      ],
    );
  }

  void showAddDrinkDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: UpdateDrink(),
        );
      },
    );
  }
}
