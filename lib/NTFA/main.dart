import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:first_app/NTFA/question.dart';
import 'package:first_app/NTFA/answer.dart';
import 'package:first_app/NTFA/clock.dart';
import 'package:first_app/NTFA/ticketType.dart';
import 'package:first_app/NTFA/expirationCard.dart';

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
  int _questionIdx = 0;
  Timer _timer;
  DateTime _dateTime = DateTime.now();
  DateTime _expTime = DateTime.now().add(Duration(minutes: 15));
  var questions = [
    {
      'questionText': 'What\'s your fav color?',
      'answers': [
        'Black',
        'Red',
        'Green',
        'Yellow',
      ]
    },
    {
      'questionText': 'What\'s your fav animal?',
      'answers': [
        'Cat',
        'Dog',
        'Corgi',
      ]
    },
    {
      'questionText': 'Who\'s your fav NBA player?',
      'answers': [
        'LeBron James',
        'Steph Curry',
      ]
    },
  ];
  void _answerQuestion() {
    setState(() {
      _questionIdx++;
    });
    print(_questionIdx);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      //更新界面
      setState(() {
        _dateTime = DateTime.now();
        _expTime = DateTime.now().add(Duration(minutes: 15));
      });
    });
  }

  String monthNumToText(int num) {
    var months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[num - 1];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'NFTA Metro',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xff3c3c3c),
                      fontWeight: FontWeight.bold),
                ),
                Visibility(
                  visible: true,
                  child: Text(
                    'Show operator your ticket',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Color(0xff3c3c3c),
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('This is a snackbar')));
                },
              ),
            ]),
        body: Column(
          children: <Widget>[
            Image.asset(
              "assets/animation.gif",
              width: 340,
            ),
            Center(
                child: Clock(
              // DateTime.now().hour.toString() + ':',
              (_dateTime.hour < 12
                      ? _dateTime.hour.toString()
                      : (_dateTime.hour - 12).toString()) +
                  ':' +
                  (_dateTime.minute < 10
                      ? '0' + _dateTime.minute.toString()
                      : _dateTime.minute.toString()) +
                  ':' +
                  (_dateTime.second < 10
                      ? '0' + _dateTime.second.toString()
                      : _dateTime.second.toString()) +
                  ' PM',
            )),
            Center(
              child: TicketType('1 Trip Bus'),
            ),
            Center(
              child: ExpirationCard(monthNumToText(_expTime.month) +
                  ' ' +
                  _expTime.day.toString() +
                  ', ' +
                  _expTime.year.toString() +
                  ', ' +
                  (_expTime.hour > 12 ? _expTime.hour - 12 : _expTime.hour)
                      .toString() +
                  ':' +
                  (_expTime.minute < 10
                      ? '0' + (_expTime.minute).toString()
                      : (_expTime.minute).toString()) +
                  ' ' +
                  (_expTime.hour > 12 ? 'PM' : 'AM')),
            )
          ],
        ),
        // _questionIdx < questions.length
        //     ? Column(
        //         children: [
        //           Question(questions[min(_questionIdx, questions.length - 1)]
        //               ['questionText'] as String),
        //           ...(questions[min(_questionIdx, questions.length - 1)]
        //                   ['answers'] as List<String>)
        //               .map((answer) => Answer(
        //                     _answerQuestion,
        //                     answer,
        //                   ))
        //               .toList()
        //         ],
        //       )
        //     :
      ),
    );
  }
}
