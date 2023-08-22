import 'package:dartz/dartz.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/Screens/worker_confirm_dialog/worker_confirm_dialog_service.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../data/Models/Event_info_model.dart';
import '../../../data/Models/worker_model.dart';
import '../../widget/no_internet_page.dart';
import '../../widget/snak_bar_for_errors.dart';
import '../event_info.dart/event_info_controller.dart';

class ConfirmWorkerController extends GetxController
    implements StatuseRequestController {
  List<WorkerModel> finalListData = [];
  List<bool> isTaped = [];
  List<WorkerEvent> artistEventinit = [];
  int eventId = 0;
  double workerCost = 0.0;
  ConfirmWorkerService service = ConfirmWorkerService();
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    // statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    await sendingARequestAndHandlingData();
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();

    super.onInit();
  }

  void changeListTileTapedState(int id) {
    isTaped[id] = !isTaped[id];
    
    update();
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
        await service.getWorkers(token);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  Future<List<WorkerModel>> whenGetDataSuccess(response) async {
    List responsedata = response['data'];
    finalListData.clear();
    for (int i = 0; i < responsedata.length; i++) {
      finalListData.add(WorkerModel.fromMap(responsedata[i]));
    }
    for (int i = 0; i < finalListData.length; i++) {
      isTaped.add(false);
    }
    for (var i = 0; i < artistEventinit.length; i++) {
      for (var j = 0; j < finalListData.length; j++) {
        if (artistEventinit[i].workerId == finalListData[j].id) {
          isTaped[j] = true;
        }
      }
    }
    update();
    return finalListData;
  }

  onpressDone() async {
    print("start debuging");
    statuseRequest = StatuseRequest.loading;
    update();
    dynamic response =
        await finishSelected(); // check if the return data is statuseRequest or real data
    statuseRequest = handlingData(response); //return the statuseResponse
    if (statuseRequest == StatuseRequest.success) {
      whenAddSuccess(response);
    } else if (statuseRequest == StatuseRequest.authfailuer) {
      snackBarForErrors("Auth error", "Please login again");
      Get.offAllNamed('LoginPage');
    } else if (statuseRequest == StatuseRequest.validationfailuer) {
      snackBarForErrors("Inputs wrong", "Please theck your inputs");
    } else {
      snackBarForErrors("Server error", "Please try again later");
    }

    update();
  }

  whenAddSuccess(var response) async{
    EventInfoController eventInfoController = Get.find();
    eventInfoController.workernumber.value += selectedArtist.length;
    selectedArtist=[];
    artistEventinit=[];

    finalListData=[];
     eventInfoController.update();
    Get.back();
    Get.delete<ConfirmWorkerController>();
  }

  List<WorkerModel> selectedArtist = [];
  finishSelected() async {
    print("start debuging 2");
    for (var j = 0; j < isTaped.length; j++) {
  if (isTaped[j]) {
    var isNewlySelected = true;
    
    for (var i = 0; i < artistEventinit.length; i++) {
      if (finalListData[j].id == artistEventinit[i].workerId) {
        isNewlySelected = false;
        break;
      }
    }
    
    if (isNewlySelected) {
      selectedArtist.add(finalListData[j]);
      print("Item added: $finalListData[j]");
    }
  }
}

    String token = await prefService.readString('token');
    String finalData = '';
    for (var i = 0; i < selectedArtist.length; i++) {
      if (selectedArtist.length - 1 == i) {
        finalData += "${selectedArtist[i].id}:$workerCost";
      } else {
        finalData += "${selectedArtist[i].id}:$workerCost,";
      }
    }
    print(finalData);
    Map<String, String> data = {
      "event_id": eventId.toString(),
      "workers": finalData
    };

    print("start debuging 3");
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.confirmWorkers(token, data);
    return response.fold((l) => l, (r) => r);
  }
}
