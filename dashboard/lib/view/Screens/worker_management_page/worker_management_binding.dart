import 'package:dashboard/view/Screens/woker_information_page/worker_inforamtion_controller.dart';
import 'package:dashboard/view/Screens/worker_management_page/worker_management_controller.dart';
import 'package:get/get.dart';

class WorkerManagementBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WorkerManagementController());
    Get.lazyPut(() => WorkerInformationController());
  }
}
