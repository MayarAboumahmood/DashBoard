import 'package:dashboard/view/Screens/add_event/add_event_binding.dart';
import 'package:dashboard/view/Screens/add_new_drink/add_new_drink.binding.dart';
import 'package:dashboard/view/Screens/add_new_reservation/add_new_reservation_binding.dart';
import 'package:dashboard/view/Screens/add_worker/add_worker_binding.dart';
import 'package:dashboard/view/Screens/admin_main_page/admin_main_page_binding.dart';
import 'package:dashboard/view/Screens/admin_main_page/admin_main_page_ui.dart';
import 'package:dashboard/view/Screens/admin_management_page/admin_management_page.dart';
import 'package:dashboard/view/Screens/drink_info/drink_info_page.dart';
import 'package:dashboard/view/Screens/event_info.dart/event_info_binding.dart';
import 'package:dashboard/view/Screens/event_info.dart/event_info_page.dart';
import 'package:dashboard/view/Screens/event_page/event_page.dart';
import 'package:dashboard/view/Screens/login/login_page.dart';
import 'package:dashboard/view/Screens/stock/stock_page.dart';
import 'package:dashboard/view/Screens/woker_information_page/worker_information_bindings.dart';
import 'package:dashboard/view/Screens/worker_management_page/worker_management_page.dart';
import 'package:get/get.dart';
import 'view/Screens/add_admin/add_admin_binding.dart';
import 'view/Screens/admin_management_page/admin_management_binding.dart';
import 'view/Screens/drink_info/drink_info_binding.dart';
import 'view/Screens/event_page/event_binding.dart';
import 'view/Screens/landing/landing.dart';
import 'view/Screens/setting/theme_binding.dart';
import 'view/Screens/login/login_binding.dart';
import 'view/Screens/stock/stock_binding.dart';
import 'view/Screens/woker_information_page/worker_information_page.dart';
import 'view/Screens/worker_management_page/worker_management_binding.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Landing(), binding: ThemeBinding()),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding()),
      GetPage(
        name: '/Home',
        page: () => Home(),
        binding: HomeBinding()
      ),
      GetPage(
          name: '/WorkerManagementPage',
          page: () => WorkerManagementPage(),
          bindings: [WorkerManagementBinding(), AddWorkerBinding()]),
      GetPage(
          name: '/WorkerInformationPage',
          page: () => WorkerInfoPage(),
          bindings: [WorkerInformationBinding()]),
      GetPage(
          name: '/AdminManagementPage',
          page: () => AdminManagementPage(),
          bindings: [AdminManagementBinding(), AddAdminBinding()]),
      GetPage(
        name: '/EventPage',
        page: () => EventPage(),
        bindings: [AddEventBinding(), EventBinding(), AddReservationBinding()],
      ),
      GetPage(
        name: '/EventInformationPage',
        page: () =>  EventInformationPage(),
        binding: EventInfoBinding()
      ),
      GetPage(
        name: '/StockPage',
        page: () => StockPage(),
        bindings: [StockBinding(), AddNewDrinkBinding()],
      ),
     
      GetPage(
          name: '/DrinkInformationPage',
          page: () => DrinkInformationPage(),
          binding: DrinkInfoBinding()),
    ];
