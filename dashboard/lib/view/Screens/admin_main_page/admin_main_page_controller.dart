import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_icons/home_icons.dart';
import '../setting/setting_page.dart';

class HomeController extends GetxController {
  late BuildContext context;
  List<dynamic> views = [];

  @override
  void onInit() {
    views.add(
      Center(
        child: HomeIcons(),
      ),
    );
    views.add(
      const Center(
        child: Text('Account'),
      ),
    );
    super.onInit();
  }

  @override
  void onReady() {
    views.add(showSettingsDialog());

    super.onReady();
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  BuildContext getContext() {
    return context;
  }

  Future<dynamic> showSettingsDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Setting(),
        );
      },
    );
  }
}
