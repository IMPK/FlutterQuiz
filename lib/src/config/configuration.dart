import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'local_config_model.dart';

class Configuration extends InheritedWidget {
  Configuration({
    @required this.localConfigModel,
    @required this.themeData,
    @required this.resource,
    Widget child,
  }) : super(child: child);

  final LocalConfigModel localConfigModel;
  final ThemeData themeData;
  final String resource;

  static Configuration of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Configuration>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
