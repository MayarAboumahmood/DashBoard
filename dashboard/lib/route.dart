import 'package:dashboard/view/Screens/admin_main_page/admin_main_page_binding.dart';
import 'package:dashboard/view/Screens/admin_main_page/admin_main_page_ui.dart';
import 'package:dashboard/view/Screens/home_icons/home_icons.dart';
import 'package:dashboard/view/Screens/home_icons/home_icons_binding.dart';
import 'package:dashboard/view/Screens/login/login_page.dart';
import 'package:dashboard/view/Screens/setting/setting_page.dart';
import 'package:get/get.dart';
import 'view/Screens/landing/landing.dart';
import 'view/Screens/setting/theme_binding.dart';
import 'view/Screens/login/login_binding.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Landing(), binding: ThemeBinding()),
      GetPage(name: '/Setting', page: () => Setting(), binding: ThemeBinding()),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding()),
      GetPage(
          name: '/Home',
          page: () => const Home(),
          bindings: [ThemeBinding(), HomeBinding()]),
      GetPage(
          name: '/HomeIcons',
          page: () => HomeIcons(),
          binding: HomeIconsBinding())
    ];
