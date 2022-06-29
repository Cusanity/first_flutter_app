import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  final String clockText;
  const Clock(this.clockText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(0),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {  },
        child: Text(
          clockText,
          style: TextStyle(
              fontSize: 56.0, color: Color(0xff3c3c3c)
            , fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
