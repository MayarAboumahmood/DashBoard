import 'package:dashboard/data/Models/all_actions_model.dart';
import 'package:dashboard/view/Screens/admin_all_action_page/admin_all_action_controller.dart';
import 'package:get/get.dart';

class GeneralSearchController extends GetxController {
  AllActionController controller = Get.find();
  List<AllActionsModel> searchModel = [];

  RxInt actionSearchedListLength = 0.obs;
  void actionSearch(String date) {
    if (searchModel.isEmpty) {
      searchModel = controller.model;
    }
    // String date = controller.model[1].event!.beginDate!.month.toString() +
    //     controller.model[1].event!.beginDate!.day.toString() +
    //     controller.model[1].event!.beginDate!.year.toString();
    // searchModel = controller.model
    //     .where((character) => {
    //           '${character.event!.beginDate!.month}-${character.event!.beginDate!.day}-${character.event!.beginDate!.year}'
    //         }.toString().startsWith(date.toLowerCase()))
    //     .toList();
    //to do after misam change the model structar...
  }
}
