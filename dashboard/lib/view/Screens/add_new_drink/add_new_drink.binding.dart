import 'package:dashboard/view/Screens/add_new_drink/add_new_drink_controller.dart';
import 'package:get/get.dart';


class AddNewDrinkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddNewDrinkController());
  }
}
