import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/theme.dart';

// ignore: must_be_immutable
class SlideDrawer extends StatelessWidget {
  SlideDrawer({super.key});
  SlideDrawerController controller = Get.put(SlideDrawerController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: controller.setWidth(65, 250),
          height: Get.size.height,
          child: Stack(
            children: [
              MouseRegion(
                onExit: (s) {
                  controller.changeDrawerStateWhenHover();
                },
                onEnter: (s) {
                  controller.changeDrawerStateWhenHover();
                },
                child: AnimatedContainer(
                  color: primaryColor,
                  duration: const Duration(milliseconds: 150),
                  width: controller.setWidth(50, 240),
                  height: Get.size.height,
                ),
              ),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  top: 60,
                  left: controller.setWidth(40, 225),
                  child: InkWell(
                    // BoxShape.highlightShape: BoxShape.circle,
                    onTap: () {
                      controller.changeDrawerState();
                    },
                    child: Container(
                      height: Get.size.height * .1,
                      decoration: const BoxDecoration(
                          color: Colors.amberAccent, shape: BoxShape.circle),
                      child: Icon(
                        controller.isCliked.value
                            ? Icons.chevron_left
                            : Icons.chevron_right,
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class SlideDrawerController extends GetxController {
  RxBool isCliked = true.obs;
  RxBool isHover = false.obs;
  Function(bool)? changeDrawerState() {
    isCliked.value = !isCliked.value;
    return isCliked;
  }

  Function(bool)? changeDrawerStateWhenHover() {
    isHover.value = !isHover.value;
    return isHover;
  }

  double setWidth(double smallWidth, double bigWidth) {
    return isCliked.value && isHover.value
        ? bigWidth
        : !isCliked.value && isHover.value
            ? bigWidth
            : isCliked.value && !isHover.value
                ? bigWidth
                : smallWidth;
  }
}
