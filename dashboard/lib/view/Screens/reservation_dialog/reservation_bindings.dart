import 'package:dashboard/view/Screens/reservation_dialog/reservation_controller.dart';
import 'package:get/get.dart';


class ReservationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ReservationController());
  }
}
