import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TicketType extends StatefulWidget  {

  @override
  State<TicketType> createState() => _TicketTypeState();
}

class _TicketTypeState extends State<TicketType>{
  String ticketTypeText = '1 Trip Bus';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                      (Set<MaterialState> states) {
                    return EdgeInsets.all(12);
                  },
                ),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
            onPressed: () {  },
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
