import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/data/Models/worker_model.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/widget/snak_bar_for_errors.dart';
import 'package:get/get.dart';

import '../../widget/no_internet_page.dart';
import 'worker_information_service.dart';

class WorkerInformationController extends GetxController {
  WorkerInformationService service = WorkerInformationService();
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  late WorkerModel model;
  List<WorkerModel> finalListData = [];
  @override
  void onInit() async {
    model = Get.arguments;
    await getdata();
    //  finalListData = await sendingARequestAndHandlingData();
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();

    super.onInit();
  }

  onPressDeleteWorker() async {
    statuseRequest = StatuseRequest.loading;
    update();
    dynamic response =
        await deleteData(); // check if the return data is statuseRequest or real data
    statuseRequest = handlingData(response); //return the statuseResponse
    if (statuseRequest == StatuseRequest.success) {
      whenDeleteDone();
    } else if (statuseRequest == StatuseRequest.authfailuer) {
      snackBarForErrors("Auth error", "Please login again");
      Get.offAllNamed('LoginPage');
    } else {
      // when happen a mestake we handel it here
    }
    update();
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  deleteData() async {
    String token = await prefService.readString('token');
    Map<String, String> data = {"worker_id": model.id.toString()};
    print(data);
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.deleteWorker(token, data);

    return response.fold((l) => l, (r) => r);
  }

  whenDeleteDone() {
    Get.offAllNamed('/EventPage');
    snackBarForErrors("Delete message", "Worker has been deleted successfully");
  }

  Future<List<WorkerModel>> sendingARequestAndHandlingData() async {
    statuseRequest = StatuseRequest.loading;
    update();
    dynamic response =
        await getdata(); // check if the return data is statuseRequest or real data
    statuseRequest = handlingData(response); //return the statuseResponse
    if (statuseRequest == StatuseRequest.success) {
      return whenGetDataSuccess(response);
    } else if (statuseRequest == StatuseRequest.authfailuer) {
      snackBarForErrors("Auth error", "Please login again");
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
        await service.getWorkerDetailes(token, model.id!);

    return response.fold((l) => l, (r) => r);
  }

  Future<List<WorkerModel>> whenGetDataSuccess(response) async {
    List responsedata = response['data'];
    for (int i = 0; i < responsedata.length; i++) {
      finalListData.add(WorkerModel.fromMap(responsedata[i]));
    }

    update();
    return finalListData;
  }
}
