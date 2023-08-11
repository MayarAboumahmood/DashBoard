import 'package:dartz/dartz.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/view/Screens/stock/stock_page.dart';
import 'package:dashboard/view/widget/snak_bar_for_errors.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../data/Models/drink_model.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../widget/no_internet_page.dart';
import 'stock_service.dart';

class StockController extends GetxController  implements StatuseRequestController{
   StockService service = StockService();
   List<DrinkModel> finalListData=[];
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    finalListData = await sendingARequestAndHandlingData();

    super.onInit();
  }

  Future<List<DrinkModel>> sendingARequestAndHandlingData() async {
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
    return [];
  }

  
  getdata() async {
    String token = await prefService.readString('token');

    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.getDrinks(token);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  Future<List<DrinkModel>>whenGetDataSuccess(response) async {
    List responsedata = response['data'];
   for (int i = 0; i < responsedata.length; i++) {
      finalListData.add(DrinkModel.fromMap(responsedata[i]));
    }
   
    update();
    return finalListData;
    
  }

  List<Drink> drinkList = [
    Drink(
        name: 'pipse',
        unitPriceInSP: 10000,
        disecraption: 'normal pipse',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3),
    Drink(
        name: '7up',
        unitPriceInSP: 10000,
        disecraption: 'normal 7up',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3),
    Drink(
        name: 'wine',
        unitPriceInSP: 30000,
        disecraption: 'normal pipse',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3),
    Drink(
        name: 'somthing',
        unitPriceInSP: 10000,
        disecraption: 'normal pipse',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3),
    Drink(
        name: 'another thing',
        unitPriceInSP: 10000,
        disecraption: 'normal pipse',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3)
  ];
}
