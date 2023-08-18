// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:typed_data';
import 'package:dashboard/constant/server_const.dart';
import 'package:dashboard/data/checkInternet/check_internet.dart';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';

class EditEventService {
  Future<Either<StatuseRequest, Map>> addEvent(Map<String, String> data,
      List<Uint8List> image, List<String> imageName, String token) async {
    //Either for return two data type in the same time
    print("start service");
    try {
      if (await checkInternet()) {
        print("starting in service");
        Uri url = Uri.parse(ServerConstApis.addEvent);
        Map<String, String> headers = {
          "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };
        var request = http.MultipartRequest("POST", url);
        for (var i = 0; i < imageName.length; i++) {
          request.files.add(http.MultipartFile.fromBytes("images", image[i],
              filename: imageName[i]));
        }

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
