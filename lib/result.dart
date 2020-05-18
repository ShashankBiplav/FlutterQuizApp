import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result({this.resultScore, this.resetHandler}); //constructor
  //getter
  String get resultPhrase {
    var resultText = 'Please try again';
    if (resultScore <= 8) {
      resultText = 'You need to reconsider your choices !';
    } else if (resultScore <= 12) {
      resultText = 'You are good at this !';
    } else if (resultScore <= 16 && resultScore >= 13) {
      resultText = 'You Did it !';
    } else if (resultScore <= 30 && resultScore >= 17) {
      resultText = 'You did it !';
    } else {
      resultText = 'You are bad !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        FlatButton(
          onPressed: resetHandler,
          child: Text('Restart Quiz'),
          textColor: Colors.red,
        ),
      ],
    );
  }
}
