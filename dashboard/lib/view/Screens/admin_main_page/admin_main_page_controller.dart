import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../data/Models/home_model.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/no_internet_page.dart';
import '../../widget/snak_bar_for_errors.dart';
import 'admin_main_page_service.dart';

class HomeController extends GetxController  implements StatuseRequestController{
HomeService service = HomeService();
  late DashboardData finalListData=DashboardData(upcomingEvents: 1, pastEvents: 1, workers: 1, customers: 1, drinks: 1, admins: 1, totalCost: 1, proceeds: 1, profit: 1);
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
     await sendingARequestAndHandlingData();

    super.onInit();
  }

   sendingARequestAndHandlingData() async {
    statuseRequest = StatuseRequest.loading;
    update();
    dynamic response =await getdata(); // check if the return data is statuseRequest or real data
    statuseRequest = handlingData(response); //return the statuseResponse
    if (statuseRequest == StatuseRequest.success) {
      return whenGetDataSuccess(response);
    } else if (statuseRequest == StatuseRequest.authfailuer) {
       snackBarForErrors("Auth error","Please login again");
        Get.offAllNamed('LoginPage');
    } else {
      // when happen a mestake we handel it here
      [];
    }
    update();
   
  }

  
  getdata() async {
    String token = await prefService.readString('token');

    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.getstats(token);

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
    final responsedata = response;
     finalListData=await DashboardData.fromJson(responsedata);
    print(finalListData);
   
    update();
    
    }
}