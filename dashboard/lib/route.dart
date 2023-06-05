import 'package:dashboard/view/Screens/add_event/add_event_binding.dart';
import 'package:dashboard/view/Screens/add_worker/add_worker_binding.dart';
import 'package:dashboard/view/Screens/admin_main_page/admin_main_page_ui.dart';
import 'package:dashboard/view/Screens/admin_management_page/admin_management_page.dart';
import 'package:dashboard/view/Screens/drink_info/drink_info_page.dart';
import 'package:dashboard/view/Screens/event_info.dart/event_info_page.dart';
import 'package:dashboard/view/Screens/event_page/event_page.dart';
import 'package:dashboard/view/Screens/login/login_page.dart';
import 'package:dashboard/view/Screens/stock/stock_page.dart';
import 'package:dashboard/view/Screens/worker_management_page/worker_management_page.dart';
import 'package:get/get.dart';
import 'view/Screens/add_admin/add_admin_binding.dart';
import 'view/Screens/admin_management_page/admin_management_binding.dart';
import 'view/Screens/event_page/event_binding.dart';
import 'view/Screens/landing/landing.dart';
import 'view/Screens/setting/theme_binding.dart';
import 'view/Screens/login/login_binding.dart';
import 'view/Screens/stock/stock_binding.dart';
import 'view/Screens/worker_management_page/worker_management_binding.dart';

appRoutes() => [
      GetPage(name: '/Home', page: () => Landing(), binding: ThemeBinding()),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding()),
      GetPage(
        name: '/',
        page: () => Home(),
      ),
      GetPage(
          name: '/WorkerManagementPage',
          page: () => WorkerManagementPage(),
          bindings: [WorkerManagementBinding(), AddWorkerBinding()]),
      GetPage(
          name: '/AdminManagementPage',
          page: () => AdminManagementPage(),
          bindings: [AdminManagementBinding(), AddAdminBinding()]),
      GetPage(
        name: '/EventPage',
        page: () => EventPage(),
        bindings: [AddEventBinding(), EventBinding()],
      ),
      GetPage(
        name: '/EventInformationPage',
        page: () => const EventInformationPage(),
      ),
      GetPage(
        name: '/StockPage',
        page: () => StockPage(),
        binding: StockBinding(),
      ),
          GetPage(
        name: '/EventInformationPage',
        page: () => const EventInformationPage(),
      ),
      GetPage(
        name: '/StockPage',
        page: () => StockPage(),
        binding: StockBinding(),
      ),
      GetPage(
        name: '/DrinkInformationPage',
        page: () => const DrinkInformationPage(),
      ),

    ];


