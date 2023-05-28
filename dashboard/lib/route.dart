import 'package:dashboard/view/Screens/add_event/add_event_binding.dart';
import 'package:dashboard/view/Screens/add_worker/add_worker_binding.dart';
import 'package:dashboard/view/Screens/admin_main_page/admin_main_page_ui.dart';
import 'package:dashboard/view/Screens/event_page/event_page.dart';
import 'package:dashboard/view/Screens/login/login_page.dart';
import 'package:dashboard/view/Screens/worker_management_page/worker_management_page.dart';
import 'package:get/get.dart';
import 'view/Screens/add_admin/add_admin_binding.dart';
import 'view/Screens/admin_management_page/admin_management-binding.dart';
import 'view/Screens/admin_management_page/admin_management_controller.dart';
import 'view/Screens/landing/landing.dart';
import 'view/Screens/setting/theme_binding.dart';
import 'view/Screens/login/login_binding.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Landing(), binding: ThemeBinding()),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding()),
      GetPage(
        name: '/Home',
        page: () => Home(),
      ),
      GetPage(
          name: '/WorkerManagementPage',
          page: () => WorkerManagementPage(),
          bindings: [AddWorkerBinding()]),
      GetPage(
          name: '/AdminManagementPage',
          page: () => AdminManagementPage(),
          bindings: [AdminManagementBinding(), AddAdminBinding()]),
      GetPage(
        name: '/EventPage',
        page: () => EventPage(),
        binding: AddEventBinding(),
      ),
    ];
