import 'package:get/get.dart';

import '../reservation_dialog/reservation_controller.dart';
import 'event_info_controller.dart';

class EventInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put( EventInfoController());
    Get.lazyPut(() => ReservationController());
    // Get.lazyPut(() => ArtistCardController());
  }
}
