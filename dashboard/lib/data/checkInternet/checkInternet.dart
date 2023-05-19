import 'dart:io';

//import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

checkInternet() async {
  try {
    //  final result = await http.get(Uri.parse('www.google.com'));
    //  var result = await InternetAddress.lookup("google.com");
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
