import 'package:flutter/material.dart';

///Created by prateek.khurana on 10-Jul 2020

class LocalConfigModel {
  static const String TRUE = 'true';
  int getReadyScreenTimer;

  LocalConfigModel({
    @required this.getReadyScreenTimer
  });

  static LocalConfigModel forEnvironment(String buildType) {
    if (buildType == 'debug') {
      return LocalConfigModel(
          getReadyScreenTimer: 4
      );
    } else {
      return LocalConfigModel(
        getReadyScreenTimer: 4
      );
    }
  }
}
