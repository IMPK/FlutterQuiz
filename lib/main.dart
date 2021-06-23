import 'package:flutter/material.dart';
import 'package:quiz/src/app.dart';
import 'package:quiz/src/config/app_theme.dart';
import 'package:quiz/src/config/configuration.dart';
import 'package:quiz/src/config/local_config_model.dart';

void main() {
  var localConfig = LocalConfigModel.forEnvironment('debug');

  var configuredApp = Configuration(
    localConfigModel: localConfig,
    themeData: AppTheme.themeData,
    resource: 'assets/images/',
    child: App(),
  );

  runApp(configuredApp);
}
