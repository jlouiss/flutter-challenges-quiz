import 'package:quiz/question.dart';

class QuizBrain {
  int _currentQuestionIndex = 0;
  List<Question> _questions = [];

  QuizBrain(List<Question> questions) {
    _questions = questions;
  }

  bool isFinished() {
    return _currentQuestionIndex == _questions.length - 1;
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    }
  }

  void reset() {
    _currentQuestionIndex = 0;
  }

  String getQuestionText() {
    return _questions[_currentQuestionIndex].text;
  }

  bool getQuestionAnswer() {
    return _questions[_currentQuestionIndex].answer;
  }
}
