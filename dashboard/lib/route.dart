import 'package:dashboard/view/Screens/login/login_page.dart';
import 'package:get/get.dart';
import 'general_controller/theme_binding.dart';
import 'view/Screens/login/login_binding.dart';
import 'view/Screens/test.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Test(), binding: ThemeBinding()),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding())
    ];
