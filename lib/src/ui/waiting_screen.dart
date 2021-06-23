import 'dart:async';

import 'package:flutter/material.dart';
import 'utility_widgets.dart' as UtilityWidgets;
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:quiz/src/blocs/question_bloc.dart';

class WaitingScreen extends StatefulWidget {
  final VoidCallback onCountDownFinished;

  const WaitingScreen({@required this.onCountDownFinished});

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
  }

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
                    'Get Ready!',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CircularCountDownTimer(
                    duration: 4,
                    initialDuration: 0,
                    // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                    controller: _controller,
                    width: MediaQuery.of(context).size.width / 3.1,

                    // Height of the Countdown Widget.
                    height: MediaQuery.of(context).size.height / 3.1,

                    // Ring Color for Countdown Widget.
                    ringColor: Colors.transparent,

                    // Ring Gradient for Countdown Widget.
                    ringGradient: null,

                    // Filling Color for Countdown Widget.
                    fillColor: Colors.transparent,

                    // Filling Gradient for Countdown Widget.
                    fillGradient: null,
                    // Background Color for Countdown Widget.
                    backgroundColor: Colors.transparent,

                    // Background Gradient for Countdown Widget.
                    backgroundGradient: null,

                    // Border Thickness of the Countdown Ring.
                    strokeWidth: 0.0,

                    // Begin and end contours with a flat edge and no extension.
                    strokeCap: StrokeCap.round,

                    // Text Style for Countdown Text.
                    textStyle: TextStyle(
                        fontSize: 115,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),

                    // Format for the Countdown Text.
                    textFormat: CountdownTextFormat.S,

                    // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                    isReverse: true,

                    // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                    isReverseAnimation: false,

                    // Handles visibility of the Countdown Text.
                    isTimerTextShown: true,

                    // Handles the timer start.
                    autoStart: true,

                    // This Callback will execute when the Countdown Starts.
                    onStart: () {
                      print('Countdown Started');
                    },
                    onComplete: () {
                     widget.onCountDownFinished();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
