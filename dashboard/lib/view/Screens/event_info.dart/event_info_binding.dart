import 'package:dashboard/view/Screens/edit_event/edit_event_controller.dart';
import 'package:get/get.dart';

class EventInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditEventController());
  }
}
