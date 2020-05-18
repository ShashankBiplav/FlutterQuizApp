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
  //adding a map for data
  final _questions = const [
    {
      'questionText': 'Question1?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'Question2?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'Question3?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
  ];
  void _answerQuestion() {
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
              : Result(),
        ),
      ),
    );
  }
}
