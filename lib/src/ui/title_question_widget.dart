import 'package:flutter/material.dart';
import 'package:quiz/src/models/question_model.dart';

class TitleQuestion extends StatefulWidget {
  final Question question;

  const TitleQuestion({this.question});

  @override
  _TitleQuestionState createState() => _TitleQuestionState();
}

class _TitleQuestionState extends State<TitleQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'Oh My Quiz!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 1.0),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              widget.question.data.stimulus.replaceAll('<p>', '').replaceAll('</p>', '').replaceAll('&nbsp;', ''),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                  letterSpacing: 1.0),
            ),
          )
        ],
      ),
    );
  }
}
