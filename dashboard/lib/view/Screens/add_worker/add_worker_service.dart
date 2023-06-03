// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dashboard/constant/server_const.dart';
import 'package:dashboard/data/Models/worker_model.dart';
import 'package:dashboard/data/checkInternet/check_internet.dart';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';

class AddWorkerService {
  Future<Either<StatuseRequest, Map>> addWorker(
      WorkerModel model, Uint8List image,String imageName, String token) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        print("starting in service");
        Uri url = Uri.parse(ServerConstApis.addWorker);
        Map<String, String> data = {
          'email': model.email,
          'first_name': model.firstName,
          'last_name': model.lastName,
          'phone_number': model.numberPhone,
          'password':'12345678',
        
        };
        Map<String, String> headers = {
          "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };
    

        var request = http.MultipartRequest("POST", url);
        var multipartFile = http.MultipartFile.fromBytes(
          "image",
          image,filename: imageName
        );
        request.files.add(multipartFile);
        request.fields.addAll(data);
        request.headers.addAll(headers);
        var myrequest = await request.send();
        var response = await http.Response.fromStream(myrequest);
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
