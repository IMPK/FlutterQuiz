import 'package:flutter/material.dart';
import 'utility_widgets.dart' as UtilityWidgets;

class EndScreen extends StatefulWidget {
  const EndScreen({Key key}) : super(key: key);

  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          UtilityWidgets.backgroundContainer(context),
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'END',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
