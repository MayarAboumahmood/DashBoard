import 'package:get/get.dart';

import 'worker_inforamtion_controller.dart';

class WorkerInformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WorkerInformationController());
  }
}
