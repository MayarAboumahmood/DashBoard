import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/data/Models/worker_model.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/widget/snak_bar_for_errors.dart';
import 'package:get/get.dart';

import '../../widget/no_internet_page.dart';
import 'worker_management_service.dart';

class WorkerManagementController extends GetxController
    implements StatuseRequestController {
   List<WorkerModel> finalListData=[];
  WorkerService service = WorkerService();
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    finalListData = await sendingARequestAndHandlingData();
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();

    super.onInit();
  }

  Future<List<WorkerModel>> sendingARequestAndHandlingData() async {
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

    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.getworkers(token);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  Future<List<WorkerModel>>whenGetDataSuccess(response) async {
    List responsedata = response['data'];
    for (int i = 0; i < responsedata.length; i++) {
      finalListData.add(WorkerModel.fromMap(responsedata[i]));
    }
   
    update();
    return finalListData;
    
  }
}
