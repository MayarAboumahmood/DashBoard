//to delete.
import 'package:dashboard/view/Screens/add_new_reservation/add_new_reservation_controller.dart';
import 'package:get/get.dart';

class AddReservationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewReservationController());
  }
}
