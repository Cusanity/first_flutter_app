import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int questionIdx = 0;

  void answerQuestion() {
    questionIdx++;
    print(questionIdx);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your fav color?',
      'What\'s your fav animal?',
      'Who\'s your fav NBA player?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App!!!'),
        ),
        body: Column(
          children: [
            Text(questions[min(questionIdx, questions.length - 1)]),
            RaisedButton(
              child: Text('Text1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Text2'),
              onPressed: () => {print('Text2 pressed!')},
            ),
          ],
        ),
      ),
    );
  }
}
