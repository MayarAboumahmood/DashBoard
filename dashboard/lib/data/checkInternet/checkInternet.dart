import 'dart:io';

//import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

checkInternet() async {
  try {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
