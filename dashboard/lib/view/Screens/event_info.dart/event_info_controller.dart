import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/data/Models/event_model.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/widget/snak_bar_for_errors.dart';
import 'package:get/get.dart';
import '../../widget/no_internet_page.dart';
import 'event_info_service.dart';

class EventController extends GetxController
    implements StatuseRequestController {
  late int id;
  late String eventStatus;
  EventInfoService service = EventInfoService();
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    eventStatus = Get.arguments[1];
    id = Get.arguments[0];
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
    Map<String, String> data = {
      "event_id": id.toString(),
    };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.getEventInfo(data, token);

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
    update();
    //return ;
  }
}