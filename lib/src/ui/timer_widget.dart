import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TimerWidget extends StatefulWidget {
  final int timerDuration;
  TimerWidget({this.timerDuration});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  CountDownController _controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularCountDownTimer(
          // Countdown duration in Seconds.
          duration: widget.timerDuration + 1,

          // Countdown initial elapsed Duration in Seconds.
          initialDuration: 0,

          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
          controller: _controller,

          // Width of the Countdown Widget.
          width: MediaQuery
              .of(context)
              .size
              .width / 3.1,

          // Height of the Countdown Widget.
          height: MediaQuery
              .of(context)
              .size
              .height / 3.1,

          // Ring Color for Countdown Widget.
          ringColor: Colors.white,

          // Ring Gradient for Countdown Widget.
          ringGradient: null,

          // Filling Color for Countdown Widget.
          fillColor: Color(0xFFDD3653),

          // Filling Gradient for Countdown Widget.
          fillGradient: LinearGradient(
            colors: [
              Color(0xFFCF349A),
              Color(0xFFDD3653),
            ]
          ),

          // Background Color for Countdown Widget.
          backgroundColor: Colors.transparent,

          // Background Gradient for Countdown Widget.
          backgroundGradient: null,

          // Border Thickness of the Countdown Ring.
          strokeWidth: 14.0,

          // Begin and end contours with a flat edge and no extension.
          strokeCap: StrokeCap.round,

          // Text Style for Countdown Text.
          textStyle: TextStyle(
              fontSize: 33.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),

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
            // Here, do whatever you want
            print('Countdown Started');
          },

          // This Callback will execute when the Countdown Ends.
          onComplete: () {
            // Here, do whatever you want
            print('Countdown Ended');
          },
        ),
      ),
    );
  }
}
