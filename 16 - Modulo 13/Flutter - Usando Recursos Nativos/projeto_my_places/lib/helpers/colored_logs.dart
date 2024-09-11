import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class ColoredLogs {
  final bool display;

  ColoredLogs({
    this.display = true,
  });

  String get _yellow => '\x1B[33m';
  String get _red => '\x1B[31m';
  String get _green => '\x1B[32m';

  void highlight<T>(T msg) {
    if (kDebugMode && display == true) {
      developer.log(
        '$_yellow$msg',
      );
    }
  }

  void error<T>(T msg) {
    if (kDebugMode && display == true) {
      developer.log(
        '$_red$msg',
      );
    }
  }

  void sucess<T>(T msg) {
    if (kDebugMode && display == true) {
      developer.log(
        '$_green$msg',
      );
    }
  }
}
