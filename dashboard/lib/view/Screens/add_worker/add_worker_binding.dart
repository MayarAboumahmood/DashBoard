import 'package:dashboard/view/Screens/add_worker/add_worker_controller.dart';
import 'package:get/get.dart';

class AddWorkerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddWorkerController());
  }
}
