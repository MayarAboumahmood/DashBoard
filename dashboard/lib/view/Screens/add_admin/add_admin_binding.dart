import 'package:dashboard/view/Screens/add_admin/add_admin_controller.dart';
import 'package:get/get.dart';

class AddAdminBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAdminController());
  }
}
