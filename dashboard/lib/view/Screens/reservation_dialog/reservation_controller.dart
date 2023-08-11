import 'package:dartz/dartz.dart';
import 'package:dashboard/data/Models/artist_model.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/Screens/reservation_dialog/reservation_service.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../widget/no_internet_page.dart';
import '../../widget/snak_bar_for_errors.dart';

class ReservationController extends GetxController
    implements StatuseRequestController {
  RxList<ArtistModel> finalListData = <ArtistModel>[].obs;
  ReservationService service = ReservationService();
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    // statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    await sendingARequestAndHandlingData();
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
  
    super.onInit();
  }

 

  Future<List<ArtistModel>> sendingARequestAndHandlingData() async {
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
        await service.getResevations(token);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  Future<List<ArtistModel>> whenGetDataSuccess(response) async {
    List responsedata = response['data'];
    
    for (int i = 0; i < responsedata.length; i++) {
      finalListData.add(ArtistModel.fromMap(responsedata[i]));
    }
    update();
    return finalListData;
  }

  
}
