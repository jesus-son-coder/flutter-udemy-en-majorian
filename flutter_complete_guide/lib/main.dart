import 'package:flutter/material.dart';
import './answer.dart';

import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final questions = [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s your favorite animals ?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questionText': 'Who\'s your favorite instructor ?',
      'answers': ['Max', 'John', 'Marc']
    },
  ];

  void _answerQuestion() {
    if(_questionIndex < questions.length) {

    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Awesome Mobile App'),
          ),
          body: _questionIndex < questions.length
          ? Column(
            children: <Widget>[
              Question(questions[_questionIndex]['questionText'] as String),
              ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          )
          : Center(
            child: Text('You did it !',
              style: TextStyle(fontSize: 40),),
          ),
       )
    );
  }
}
