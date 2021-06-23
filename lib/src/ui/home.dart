import 'package:flutter/material.dart';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:quiz/src/ui/question_screen.dart';
import 'package:quiz/src/ui/waiting_screen.dart';

import 'end_screen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  List<String> questionUrlList = [
    'https://raw.githubusercontent.com/tataclassedge/demo-app/main/assign1/question2.json',
    'https://raw.githubusercontent.com/tataclassedge/demo-app/main/assign1/question1.json'
  ];
  int currentQuestionIndex = 0;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UITypeState _currentState = UITypeState.WAITING;


  @override
  Widget build(BuildContext context) {
    return initializeWidget();
  }

  Widget initializeWidget() {
    switch (_currentState) {
      case UITypeState.WAITING:
        return WaitingScreen(
          onCountDownFinished: () {
            changeState(UITypeState.QUIZ);
          },
        );
        break;
      case UITypeState.QUIZ:
        return QuestionScreen(
          url: widget.questionUrlList.elementAt(widget.currentQuestionIndex),
          didAnswered: (index, isCorrect) {
            widget.currentQuestionIndex++;
            if(widget.currentQuestionIndex < widget.questionUrlList.length) {
              changeState(UITypeState.WAITING);
            }else {
              changeState(UITypeState.END);
            }

          },
        );
        break;
      case UITypeState.END:
        return EndScreen();
        break;
      default:
        return WaitingScreen();
        break;
    }
  }

  changeState(UITypeState newUIState) {
    setState(() {
      _currentState = newUIState;
    });
  }
}

enum UITypeState {
  WAITING,
  QUIZ,
  END
}

extension UITypeStateExtension on UITypeState {
  String get rawValue {
    switch (this) {
      case UITypeState.WAITING:
        return "WAITING";

      case UITypeState.QUIZ:
        return "QUIZ";

      case UITypeState.END:
        return "END";

      default:
        return "WAITING";
    }
  }

  UITypeState parse(String type) {}
}
