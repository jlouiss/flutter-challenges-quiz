import 'package:quiz/question.dart';

class QuizBrain {
  int _currentQuestionIndex = 0;
  List<Question> _questions = [];

  QuizBrain(questions) {
    _questions = questions;
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    }
  }

  String getQuestionText() {
    return _questions[_currentQuestionIndex].text;
  }

  bool getQuestionAnswer() {
    return _questions[_currentQuestionIndex].answer;
  }
}
