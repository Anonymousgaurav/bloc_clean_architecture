import 'package:custom_bloc_state_management/network/NetConfig.dart';

class Logger {
  static void log(String msg) {
    if (NetConfig.env == Environments.DEV) {
      print(msg);
    }
  }

  static void i({required String tag, required String msg}) {
    if (NetConfig.env == Environments.DEV) {
      print("$tag $msg");
    }
  }

  static void d(String msg) {
    if (NetConfig.env == Environments.DEV) {
      print(msg);
    }
  }

  static void e({String tag = "", required String msg, Exception? error}) {
    print("$tag $msg ${error?.toString()}");
  }
}
