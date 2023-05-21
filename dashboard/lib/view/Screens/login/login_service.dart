import 'dart:convert';

import 'package:dashboard/constant/server_const.dart';
import 'package:dashboard/data/Models/login_model.dart';
import 'package:dashboard/data/checkInternet/checkInternet.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dashboard/constant/status_request.dart';

class LoginService {
  Future<Either<StatuseRequest, Map>> login(LoginModel model) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        Uri url =
            Uri.parse(ServerConstApis.adminLogin);
        var response = await http.post(
          url,
          body: {
            "password": model.password,
            "email":model.email
          },
        );
       if (response.statusCode == 200 || response.statusCode == 201) {
          final responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else if (response.statusCode == 400) {
          return const Left(StatuseRequest.validationfailuer);
        }else if(response.statusCode==401){
          return const Left(StatuseRequest.authfailuer);
        }
         else {
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
