// import 'package:dashboard/data/service/pref_service.dart';
import 'package:dashboard/main.dart';
import 'package:get/get.dart';

class OnBoardContoller extends GetxController {
  List<Map<String, String>> pagedetals = [
    {
      "title": "welcome to our app",
      "image": "assets/images/small page background image.jpg"
    },
    {
      "title": "manage all the house with this system",
      "image": "assets/images/small page background image.jpg"
    },
    {
      "title": "other thing need to rewrite",
      "image": "assets/images/small page background image.jpg"
    },
    {
      "title": "other thing need to rewrite",
      "image": "assets/images/small page background image.jpg"
    }
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
  onpress()async{
  // if(await prefService.isContainKey('token')){
  //   Get.offAllNamed('/Home');
  // }else{
    Get.offNamed('/LoginPage');
  // }
  }
  
}
