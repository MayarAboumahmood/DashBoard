import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/status_request.dart';
import '../../../data/Models/Event_info_model.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/snak_bar_for_errors.dart';

import '../reservation_dialog/reservation_controller.dart';
import 'add_new_reservation_service.dart';

class AddNewReservationController extends GetxController
    implements StatuseRequestController {
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late GlobalKey<FormState> formstate;
  AddReservationService service = AddReservationService();
  late String customerName;
  late String numberOfSets;
  int eventId=0;
  @override
  void onInit() {
    customerName = '';
    numberOfSets = '';
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  onPressDone() async {
    FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      statuseRequest = StatuseRequest.loading;
      update();

      dynamic response =
          await addData(); // check if the return data is statuseRequest or real data
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
    }
    update();
  }

  addData() async {
    String token = await prefService.readString('token');

    Map<String, String> data = {
      "event_id": eventId.toString(),
      "number_of_places": numberOfSets,
      "customer_name": customerName
    };
    Either<StatuseRequest, Map<dynamic, dynamic>> response = await service
        .addReservation(data, token);
    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  whenAddSuccess(response) async {
     ReservationController reservationController = Get.find();
  reservationController.finalListData.add(Reservation(orders: [], numberOfPlaces: int.parse(numberOfSets), customerName: customerName, eventId: eventId));
reservationController.update();
  Get.back();
  }
}
