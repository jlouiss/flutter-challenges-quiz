import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain(defaultQuestions);

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
            child: Padding(
          child: QuizPage(),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  static const Icon correctIcon = Icon(Icons.check, color: Colors.green);
  static const Icon wrongIcon = Icon(Icons.close, color: Colors.red);

  List<Icon> answerResults = [];

  void checkAnswer(bool userAnswer) {
    bool isAnswerCorrect = userAnswer == quizBrain.getQuestionAnswer();

    setState(() {
      answerResults.add(isAnswerCorrect ? correctIcon : wrongIcon);
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            padding: EdgeInsets.all(15.0),
          ),
        ),
        Expanded(
          child: Padding(
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              textColor: Colors.white,
            ),
            padding: EdgeInsets.all(15.0),
          ),
        ),
        Expanded(
          child: Padding(
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
            padding: EdgeInsets.all(15.0),
          ),
        ),
        Row(
          children: answerResults,
        ),
      ],
    );
  }
}
