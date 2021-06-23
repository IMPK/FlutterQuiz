

import 'package:quiz/src/models/question_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class QuestionBloc {
  final _repository = Repository();
  final _questionFetcher = PublishSubject<Question>();

  Observable<Question> get nextQuestion => _questionFetcher.stream;

  fetchQuestion(String url) async {
    Question questionModel = await _repository.fetchNextQuestion(url);
    _questionFetcher.sink.add(questionModel);
  }

  Future<Question> loadQuestion() {

  }

  dispose() {
    _questionFetcher.close();
  }
}

final bloc = QuestionBloc();