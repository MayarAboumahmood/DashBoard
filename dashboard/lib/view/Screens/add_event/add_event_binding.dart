import 'package:dashboard/view/Screens/add_event/add_event_controller.dart';
import 'package:get/get.dart';

class AddEventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddEventController());
  }
}
