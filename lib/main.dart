import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    //adding a map for data
    var questions = [
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Question(
                questionText: questions[_questionIndex]['questionText'],
              ),
              // here "..." is a spread operator in Dart
             ...(questions[_questionIndex]['answers'] as List<String>).map((answer){
               return Answer(selectHandler:_answerQuestion, answerText: answer);
             }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
