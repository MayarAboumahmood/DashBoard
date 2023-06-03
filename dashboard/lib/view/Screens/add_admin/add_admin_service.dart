// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:dashboard/constant/server_const.dart';
import 'package:dashboard/data/Models/admin_model.dart';
import 'package:dashboard/data/Models/worker_model.dart';
import 'package:dashboard/data/checkInternet/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class AddAdminService {
  Future<Either<StatuseRequest, Map>> addadmin(Map<String,dynamic> data) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        Uri url = Uri.parse(ServerConstApis.newAdmin);
        var response = await http.post(
          url,
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
      return const Left(StatuseRequest.offlinefailure);
    }
  }
}
