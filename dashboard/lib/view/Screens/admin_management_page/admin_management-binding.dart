import 'package:get/get.dart';

import 'admin_management_page.dart';

class AdminManagementBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminManagementController());
  }
}
