import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../constant/server_const.dart';
import '../../../constant/status_request.dart';
import '../../../data/checkInternet/check_internet.dart';
import 'package:http/http.dart' as http;

class StockService {
  Future<Either<StatuseRequest, Map>> getDrinks(String token) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        Uri url = Uri.parse(ServerConstApis.showAllDrinks);
        Map<String, String> headers = {
          "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };

        var response = await http.get(url, headers: headers);
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else if (response.statusCode == 403) {
          return const Left(StatuseRequest.authfailuer);
        } else {
          return const Left(StatuseRequest.serverfailure);
        }
      } else {
        return const Left(StatuseRequest
            .offlinefailure); //left return the left data type =>StatuseRequest
      }
    } catch (e) {
      return const Left(StatuseRequest.offlinefailure);
    }
  }
}
