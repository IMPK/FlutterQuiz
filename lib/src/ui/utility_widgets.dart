import 'package:flutter/material.dart';
import 'package:quiz/src/config/configuration.dart';

Widget backgroundContainer(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: new BoxDecoration(
      gradient: new RadialGradient(
        colors: [
          Configuration.of(context).themeData.backgroundColor,
          Configuration.of(context).themeData.accentColor,
        ],
      ),
    ),
  );
}