checkInternet() async {
  /* try {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.wifi &&
        connectivityResult != ConnectivityResult.ethernet &&
        connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.other) {
      return false;
    } else {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }*/
  return true;
}
