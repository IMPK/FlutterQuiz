import 'dart:async';

import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:quiz/src/models/question_model.dart';

class QuestionProvider {
  Client client = Client();

  Future<Question> fetchQuestion(String questionUrl) async {
    List<Question> _questionsList = [];
    print("entered");
    final response = await client.get(
        questionUrl);
    print(response.body.toString());
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      list.forEach((questionItem) {
        _questionsList.add(
          Question.fromJson(
            questionItem
          ),
        );
      });
      return _questionsList.elementAt(0);
    } else {
      throw Exception('Failed to load Question');
    }
  }
}
