import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../data/Models/all_actions_model.dart';
import '../../../data/Models/home_model.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/no_internet_page.dart';
import '../../widget/snak_bar_for_errors.dart';
import 'admin_all_action_service.dart';

class AllActionController extends GetxController  implements StatuseRequestController{
AdminAllActionService service = AdminAllActionService();
   List<AllActionsModel> model=[];
  late int adminId;
   @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    adminId=Get.arguments;
    print(adminId);
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
     model=await sendingARequestAndHandlingData();

    super.onInit();
  }

   Future<List<AllActionsModel>> sendingARequestAndHandlingData() async {
    statuseRequest = StatuseRequest.loading;
    update();
    dynamic response =await getdata(); // check if the return data is statuseRequest or real data
    statuseRequest = handlingData(response); //return the statuseResponse
    if (statuseRequest == StatuseRequest.success) {
      return whenGetDataSuccess(response);
    } else if (statuseRequest == StatuseRequest.authfailuer) {
       snackBarForErrors("Auth error","Please login again");
        Get.offAllNamed('LoginPage');
    } else {
      // when happen a mestake we handel it here
      [];
    }
    update();
   return [];
  }

  
  getdata() async {
    String token = await prefService.readString('token');
Map<String,String> data={
    "admin_id":adminId.toString()
};
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.getstats(token,data);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

Future<List<AllActionsModel>>  whenGetDataSuccess(response) async {
    List responsedata = response['data'];
    for (var i = 0; i < responsedata.length; i++) {
      
     model.add(AllActionsModel.fromJson(responsedata[i]));
    }
    update();
    return model;
    }
}