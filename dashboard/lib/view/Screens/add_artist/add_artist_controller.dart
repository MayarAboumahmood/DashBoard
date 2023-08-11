import 'package:dartz/dartz.dart';
import 'package:dashboard/data/Models/artist_model.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/Screens/add_artist/add_artist_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../widget/snak_bar_for_errors.dart';
import '../select_artist/select_artist_controller.dart';

class AddArtistController extends GetxController
    implements StatuseRequestController {
  late String name;
  late String information;
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late GlobalKey<FormState> formstate;
  late AddArtistService service;

  @override
  void onInit() {
    name = '';
    information = '';
    service = AddArtistService();
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
      "artist_name": name,
      "description": information,
    };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.addArtist(data, token);
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
    SelectArtistController artistController = Get.find();
  artistController.finalListData.add(ArtistModel(name: name, information: information));
artistController.isTaped.add(false);
artistController.update();
  Get.back();
  }
}
