import 'dart:async';

import 'package:quiz/src/models/question_model.dart';
import 'package:quiz/src/resources/question_provider.dart';


class Repository {
  final questionProvider = QuestionProvider();

  Future<Question> fetchNextQuestion(String url) => questionProvider.fetchQuestion(url);
}