import 'package:dashboard/view/Screens/add_event/add_event_binding.dart';
import 'package:dashboard/view/Screens/add_worker/add_worker_binding.dart';
import 'package:dashboard/view/Screens/admin_main_page/admin_main_page_ui.dart';
import 'package:dashboard/view/Screens/admin_management_page/admin_management_page.dart';
import 'package:dashboard/view/Screens/event_info.dart/event_info_page.dart';
import 'package:dashboard/view/Screens/event_page/event_page.dart';
import 'package:dashboard/view/Screens/login/login_page.dart';
import 'package:dashboard/view/Screens/stock/stock_page.dart';
import 'package:dashboard/view/Screens/worker_management_page/worker_management_page.dart';
import 'package:get/get.dart';
import 'view/Screens/add_admin/add_admin_binding.dart';
import 'view/Screens/admin_management_page/admin_management_binding.dart';
import 'view/Screens/landing/landing.dart';
import 'view/Screens/setting/theme_binding.dart';
import 'view/Screens/login/login_binding.dart';
import 'view/Screens/stock/stock_binding.dart';

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
          page: () => const WorkerManagementPage(),
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
      GetPage(
        name: '/EventInformationPage',
        page: () => EventInformationPage(),
      ),
      GetPage(
        name: '/StockPage',
        page: () => StockPage(),
        binding: StockBinding(),
      ),
    ];
