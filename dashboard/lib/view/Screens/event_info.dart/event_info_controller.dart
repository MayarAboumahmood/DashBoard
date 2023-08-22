import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/widget/snak_bar_for_errors.dart';
import 'package:get/get.dart';
import '../../../data/Models/Event_info_model.dart';
import '../../widget/no_internet_page.dart';
import '../event_page/event_controller.dart';
import 'event_info_service.dart';

class EventInfoController extends GetxController
    implements StatuseRequestController {
   String isPast ="false";
  late int id;
  late String eventStatus;
  EventInfoModel? model;
  RxInt workernumber=0.obs;
  EventInfoService service = EventInfoService();
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    await sendingARequestAndHandlingData();
    workernumber.value=model!.data.event.workerEvents.length;
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    super.onInit();
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
    String token = await prefService.readString('token');
    id = int.parse(await prefService.readString('eventId'));
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
    final dataResponse = response;
    EventInfoModel2 d = EventInfoModel2();
    model = d.parseApiResponse(dataResponse);
EventController event=Get.find();
for (var element in event.pastList) {
  if(element.id== model!.data.event.eventId){
    isPast="true";
print(isPast);
  }
}
print(isPast);
    update();
    //return ;
  }

  whenDeleteEventSuccess(response) {
    Get.offAllNamed('/EventPage');
    snackBarForErrors("Delete message", "Worker has been deleted successfully");
  }

  deleteData() async {
    String token = await prefService.readString('token');
    Map<String, String> data = {
      "event_id": id.toString(),
    };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.deleteEvent(data, token);

    return response.fold((l) => l, (r) => r);
  }

  pressDeleteEvent() async {
    statuseRequest = StatuseRequest.loading;
    update();
    dynamic response =
        await deleteData(); // check if the return data is statuseRequest or real data
    statuseRequest = handlingData(response); //return the statuseResponse
    if (statuseRequest == StatuseRequest.success) {
      return whenDeleteEventSuccess(response);
    } else if (statuseRequest == StatuseRequest.authfailuer) {
      snackBarForErrors("Auth error", "Please login again");
      Get.offAllNamed('LoginPage');
    } else {
      // when happen a mestake we handel it here
      [];
    }
    update();
  }
}
