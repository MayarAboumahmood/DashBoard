// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dashboard/constant/server_const.dart';
import 'package:dashboard/data/checkInternet/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';

class AddReservationService {
  Future<Either<StatuseRequest, Map>> addReservation(
      Map<String,String> data, String token) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        print(token);
        Uri url = Uri.parse(ServerConstApis.newadminreservation);
          Map<String, String> headers = {
          "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };
    
        var response = await http.post(
          url,
          headers: headers,
          body: data,
        );
       
        if (response.statusCode == 200 || response.statusCode == 201) {
          final responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else if (response.statusCode == 400) {
          return const Left(StatuseRequest.validationfailuer);
        } else if (response.statusCode == 401) {
          return const Left(StatuseRequest.authfailuer);
        } else {
          return const Left(StatuseRequest.serverfailure);
        }
      } else {
        return const Left(StatuseRequest
            .offlinefailure); //left return the left data type =>StatuseRequest
      }
    } catch (e) {
      print(e);
      return const Left(StatuseRequest.serverfailure);
    }
  }
}
