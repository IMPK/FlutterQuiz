import 'package:flutter/material.dart';
import 'package:quiz/src/models/question_model.dart';
import 'package:quiz/src/ui/timer_widget.dart';
import 'package:quiz/src/ui/title_question_widget.dart';
import '../blocs/question_bloc.dart';
import 'option_widget.dart';
import 'utility_widgets.dart' as UtilityWidgets;

typedef didAnswerGiven = Function(int index, bool isOptionCorrect);

class QuestionScreen extends StatefulWidget {
  final didAnswerGiven didAnswered;
  final String url;

  QuestionScreen({this.url, this.didAnswered});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    bloc.fetchQuestion(widget.url);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: StreamBuilder(
        stream: bloc.nextQuestion,
        builder: (context, AsyncSnapshot<Question> snapshot) {
          if (snapshot.hasData) {
            return buildScreenLayout(context, snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Stack(
            children: [
              UtilityWidgets.backgroundContainer(context),
              Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }

  Widget buildScreenLayout(
      BuildContext buildContext, AsyncSnapshot<Question> snapshot) {
    return Stack(
      children: [
        UtilityWidgets.backgroundContainer(buildContext),
        initializeWidget(snapshot.data)
      ],
    );
  }

  Widget initializeWidget(Question questionData) {
    return Column(
      children: [
        Expanded(
          flex: 27,
          child: Container(
            child: TitleQuestion(
              question: questionData,
            ),
          ),
        ),
        Expanded(
          flex: 23,
          child: Container(
            padding: EdgeInsets.only(top: 8.0),
            child: TimerWidget(
              timerDuration: questionData.data.metadata.duration,
            ),
          ),
        ),
        Expanded(
          flex: 50,
          child: Container(
            child: OptionsWidget(
              containerSize: Size(30, 30),
              fontSize: 12.0,
              question: questionData,
              tapOption: (isCorrect, itemIndex) {
                widget.didAnswered(itemIndex, isCorrect);
              },
            ),
          ),
        )
      ],
    );
  }
}
