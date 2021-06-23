import 'package:flutter/material.dart';
import 'package:quiz/src/ui/home.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

