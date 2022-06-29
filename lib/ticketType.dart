import 'dart:math';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TicketType extends StatefulWidget {
  const TicketType({Key? key}) : super(key: key);

  @override
  State<TicketType> createState() => _TicketTypeState();
}

class _TicketTypeState extends State<TicketType> {
  String ticketTypeText = "1 Trip Bus";
  // 0xfff5b400
  Color ticketColor = Colors.black;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(0),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                      (Set<MaterialState> states) {
                    return EdgeInsets.all(8);
                  },
                ),
                backgroundColor: MaterialStateProperty.all(ticketColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
            onPressed: () {
              if(ticketTypeText == '1 Trip Bus'){
                ticketTypeText = '1 Trip RAIL';
                ticketColor = Color(0xfff5b400);
              }
              else{
                ticketTypeText = '1 Trip Bus';
                ticketColor = Colors.black;
              }
            },
            child: Text(
              ticketTypeText,
              style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}