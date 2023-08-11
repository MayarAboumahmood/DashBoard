import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/data/Models/event_model.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/widget/snak_bar_for_errors.dart';
import 'package:get/get.dart';
import '../../widget/no_internet_page.dart';
import 'event_service.dart';

class EventController extends GetxController
    implements StatuseRequestController {
  List<EventModel> nowList = [];
  List<EventModel> upComingList = [];
  List<EventModel> pastList = [];
  EventService service = EventService();
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    // statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    await sendingARequestAndHandlingData();
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    super.onInit();
  }

  Future<List<EventModel>> sendingARequestAndHandlingData() async {
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
        await service.getEvents(token);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  Future<List<EventModel>> whenGetDataSuccess(response) async {
    List responsePastdata = response['data']['past'];
    List responseNowdata = response['data']['now'];
    List responseUPcomingdata = response['data']['upComing']; 
    for (int i = 0; i < responsePastdata.length; i++) {
      pastList.add(EventModel.fromMap(responsePastdata[i]));
    }
    for (int i = 0; i < responseNowdata.length; i++) {
      nowList.add(EventModel.fromMap(responseNowdata[i]));
    }
    for (int i = 0; i < responseUPcomingdata.length; i++) {
      upComingList.add(EventModel.fromMap(responseUPcomingdata[i]));
    }
    update();
    return [];
  }
}
