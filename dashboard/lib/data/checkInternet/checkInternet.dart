import 'dart:io';

//import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

checkInternet() async {
  try {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.wifi &&
        connectivityResult != ConnectivityResult.ethernet &&
        connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.other) {
      print('connectivityResult false false.. :');
      print(connectivityResult);
      return false;
    } else {
      print('connectivityResult :');
      print(connectivityResult);
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
