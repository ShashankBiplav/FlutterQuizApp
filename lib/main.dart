import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  //reset quiz function
  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  //adding a map for data
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Dog', 'score': 8},
        {'text': 'Cat', 'score': 4},
        {'text': 'Horse', 'score': 10},
      ],
    },
    {
      'questionText': 'what\'s my app development score?',
      'answers': [
        {'text': 'Excellent', 'score': 10},
        {'text': 'Very good', 'score': 8},
        {'text': 'Good', 'score': 4},
        {'text': 'Average', 'score': 2},
      ],
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });
      print(_questionIndex);
    } else {
      // _questionIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Center(
          child: _questionIndex < _questions.length
              ? Quiz(
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                )
              : Result(
                  resultScore: _totalScore,
                  resetHandler: _resetQuiz,

                ),
        ),
      ),
    );
  }
}
