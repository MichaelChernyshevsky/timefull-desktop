import 'dart:io';

Future<bool> get internetConnected async {
  try {
    // final result = await InternetAddress.lookup('example.com');
    // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //     return true;

    // }
    return false;
  } on SocketException catch (_) {
    return false;
  }
}
