// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/constant/sizes.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HoverButton extends StatelessWidget {
  var isHover = true.obs;
  Widget child;
  Function()? ontap;
  Color? mycolor;
  double mywidth;
  double myheight;
  double myRadius;
  double myShadow;
  double paddingInside;
  HoverButton({
    Key? key,
    /*required this.bordercolor,*/
    required this.child,
    required this.ontap,
    this.mycolor,
    required this.mywidth,
    required this.myheight,
    this.myRadius = 20,
    this.myShadow = 0,
    this.paddingInside = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onHover: changeTheOnHover(),
        splashColor: Colors.white,
        onTap: ontap,
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: EdgeInsets.symmetric(
                horizontal: Sizes(context).normalButtonInsidePaddin),
            alignment: Alignment.center,
            height:
                isHover.value ? myheight + Get.size.height * .008 : myheight,
            width: isHover.value ? mywidth + Get.size.width * .015 : mywidth,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(2, 4),
                      color: Colors.black26,
                      spreadRadius: 01,
                      blurRadius: 8)
                ],
                color: Get.isDarkMode && !isHover.value
                    ? mycolor
                    : Get.isDarkMode && isHover.value
                        ? darkHoverButtonColor
                        : !Get.isDarkMode && !isHover.value
                            ? mycolor
                            : lightHoverButtonColor,
                borderRadius: BorderRadius.circular(myRadius)),
            child: child,
          ),
        ));
  }

  Function(bool)? changeTheOnHover() {
    isHover.value = !isHover.value;
    return isHover;
  }
}
