import 'package:get/get.dart';

import '../edit_event/edit_event_controller.dart';
import '../reservation_dialog/reservation_controller.dart';
import 'event_info_controller.dart';

class EventInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put( EventInfoController());
    Get.lazyPut(() => ReservationController());
     Get.lazyPut(() => EditEventController());
  }}

