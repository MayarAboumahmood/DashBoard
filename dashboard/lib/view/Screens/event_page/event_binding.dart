import 'package:dashboard/view/Screens/event_page/event_controller.dart';
import 'package:get/get.dart';


class EventBinding implements Bindings
{
  @override
  void dependencies() {
 Get.lazyPut(() => EventController());
  }

}