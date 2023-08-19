import 'package:get/get.dart';
import 'admin_all_action_controller.dart';

class AllActoinBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AllActionController());
  }
}
