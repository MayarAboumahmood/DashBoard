import 'package:dashboard/view/Screens/login/login_page.dart';
import 'package:get/get.dart';
import 'view/Screens/login/login_binding.dart';
import 'view/Screens/test.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Test()),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding())
    ];
