import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/data/Models/worker_model.dart';
import 'package:dashboard/main.dart';
import 'package:get/get.dart';

import '../../widget/no_internet_page.dart';
import 'worker_management_service.dart';

class WorkerManagementController extends GetxController {
  //StatuseRequest? statuseRequest = StatuseRequest.init;
  late List<WorkerModel> workerList;
  WorkerService service=WorkerService();
  Rx<StatuseRequest> statuseRequest=Rx<StatuseRequest>(StatuseRequest.init);
  @override
  void onInit() async{
    workerList = [];
     
    statuseRequest.value = await checkIfTheInternetIsConectedBeforGoingToThePage();
  //  getWorkers();
    super.onInit();
  }
   void getWorkers() async {
      statuseRequest.value = StatuseRequest.loading;
      update();
     dynamic response = await getdata(); // check if the return data is statuseRequest or real data
      statuseRequest = handlingData(response); //return the statuseResponse
      if (statuseRequest.value == StatuseRequest.success) {
          whenGetDataSuccess(response);
      } else if (statuseRequest.value == StatuseRequest.authfailuer) {
        snackBarForErrors();
      } else {
        // when happen a mestake we handel it here
      }
    
    update();
  }

  SnackbarController snackBarForErrors() {
    return Get.snackbar(
        "Incorrect email or password".tr, ///// adding for translate  done
        "Try entering your data again".tr, //// adding for translate  done
        snackPosition: SnackPosition.TOP,
        colorText: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
        backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
        duration: const Duration(seconds: 5));
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

  whenGetDataSuccess(response) async {
    List responsedata = response['data']; 
    // for getting a body of data from map and save a token in local dataBase
   for(var  item in responsedata){
      workerList.add(WorkerModel.fromMap(responsedata[item]));
   }
    for(var  item in workerList){
      print(item.firstName);
   }
    update();
  }


}
