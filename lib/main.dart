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
    List<String> questions = ['Question1?', 'Question2?', 'Question3?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Question(questionText: questions[_questionIndex],),
              Answer(
                selectHandler: _answerQuestion,
              ), //passing callback to the Answer widget
              Answer(
                selectHandler: _answerQuestion,
              ),
              Answer(
                selectHandler: _answerQuestion,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
