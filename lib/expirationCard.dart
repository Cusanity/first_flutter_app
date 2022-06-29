import 'package:flutter/material.dart';

class ExpirationCard extends StatefulWidget {
  const ExpirationCard({Key? key}) : super(key: key);

  @override
  State<ExpirationCard> createState() => _ExpirationCardState();
}

class _ExpirationCardState extends State<ExpirationCard> {
  DateTime _expTime = DateTime.now().add(Duration(minutes: 15));
  String ticketType = 'Bus';

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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              child: ListTile(
                title: Text('Adult Single Trip ' + ticketType,
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Color(0xff3c3c3c),
                        fontWeight: FontWeight.bold)),
                subtitle: Text('Buffalo, NY\n',
                    style: TextStyle(
                      fontSize: 13.0,
                    )),
              ),
              onTap: () {
                setState(() {
                  if (ticketType == 'Bus') {
                    ticketType = 'Rail';
                    _expTime = DateTime.now().add(Duration(minutes: 45));
                  }
                  else{
                    ticketType = 'Bus';
                    _expTime = DateTime.now().add(Duration(minutes: 15));
                  }
                });
              },
            ),
            Row(
              children: <Widget>[
                Text(
                    '    Expires ' +
                        monthNumToText(_expTime.month) +
                        ' ' +
                        _expTime.day.toString() +
                        ', ' +
                        _expTime.year.toString() +
                        ', ' +
                        (_expTime.hour > 12
                                ? _expTime.hour - 12
                                : _expTime.hour)
                            .toString() +
                        ':' +
                        (_expTime.minute < 10
                            ? '0' + (_expTime.minute).toString()
                            : (_expTime.minute).toString()) +
                        ' ' +
                        (_expTime.hour > 12 ? 'PM' : 'AM') +
                        '\n',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff3c3c3c),
                        fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
