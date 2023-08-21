// import 'package:dashboard/data/service/pref_service.dart';
import 'package:dashboard/main.dart';
import 'package:get/get.dart';

class OnBoardContoller extends GetxController {
  List<Map<String, String>> pagedetals = [
    {
      "title": "welcome to our app",
      "image": "assets/images/first landing image.jpg"
    },
    {
      "title": "Dar abdullah management system",
      "image": "assets/images/second landing image.jpg.jpg"
    },
    {
      "title": "DashBoard version",
      "image": "assets/images/thierd landing image.jpg.jpg"
    },
  ];
  // ignore: prefer_typing_uninitialized_variables
  var pageindex;
  @override
  void onInit() async {
    pageindex = 1.obs;
    // PrefService store = PrefService();
    // UserInformation.app_theme = await store.readString("theme") ?? "light";
    // UserInformation.app_theme == "light"
    //     ? Get.changeTheme(Themes.customlighttheme)
    //     : Get.changeTheme(Themes.customdarktheme);

    super.onInit();
  }

  onpress() async {
    if (await prefService.isContainKey('token')) {
      Get.offAllNamed('/Home');
    } else {
      Get.offNamed('/LoginPage');
    }
  }
}
