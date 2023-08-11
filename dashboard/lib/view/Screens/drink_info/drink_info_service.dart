// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:typed_data';
import 'package:dashboard/constant/server_const.dart';
import 'package:dashboard/data/checkInternet/check_internet.dart';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';

class UpdateAndDeleteDrinkService {
  Future<Either<StatuseRequest, Map>> deleteDrink(
      Map<String, String> data, String token) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        print("starting in service");
        Uri url = Uri.parse(ServerConstApis.deleteDrink);

        Map<String, String> headers = {
          "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };

        var response = await http.delete(
          url,
          headers: headers,
          body: data,
        );
        print(response.body);
        print(response.statusCode);
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

  Future<Either<StatuseRequest, Map>> updateDrink(Map<String, String> data,
      Uint8List image, String imageName, String token) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        print("starting in service");
        Uri url = Uri.parse(ServerConstApis.updateDrink);

        Map<String, String> headers = {
          "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };
        print(data['drink_id']);

        // var request = http.MultipartRequest("PUT", url);
        // var multipartFile = http.MultipartFile.fromBytes(
        //   "picture",
        //   image,filename: imageName
        // );
        // request.files.add(multipartFile);
        // request.fields.addAll(data);
        // request.headers.addAll(headers);
        // var myrequest = await request.send();
        var response = await http.put(
          url,
          headers: headers,
          body: data,
        );
        // var response = await http.Response.fromStream(myrequest);
        print(response.body);
        print(response.statusCode);
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
