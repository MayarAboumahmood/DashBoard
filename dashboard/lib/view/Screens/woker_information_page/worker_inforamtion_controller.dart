import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/widget/snak_bar_for_errors.dart';
import 'package:get/get.dart';

import '../../../data/Models/worker_information.dart';
import '../../widget/no_internet_page.dart';
import 'worker_information_service.dart';

class WorkerInformationController extends GetxController
    implements StatuseRequestController {
  WorkerInformationService service = WorkerInformationService();
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  // late WorkerModel model;
  late int id;
  WorkerInformationModel? finalData;
  @override
  void onInit() async {
    await sendingARequestAndHandlingData();
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();

    super.onInit();
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  sendingARequestAndHandlingData() async {
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
    id = int.parse(await prefService.readString('Worker_id'));
    String token = await prefService.readString('token');
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.getWorkerDetailes(token, id);

    return response.fold((l) => l, (r) => r);
  }

  whenGetDataSuccess(response) async {
    final responsedata = response['data'];
    print(responsedata);
    finalData = WorkerInformationModel.fromMap(responsedata);
    print(finalData!.email);

    update();
    return finalData;
  }

  ////////////////////// delete
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

  whenDeleteDone() {
    Get.offAllNamed('/WorkerManagementPage');
    snackBarForErrors("Delete message", "Worker has been deleted successfully");
  }

  deleteData() async {
    String token = await prefService.readString('token');
    Map<String, String> data = {"worker_id": id.toString()};
    print(data);
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.deleteWorker(token, data);

    return response.fold((l) => l, (r) => r);
  }
}
