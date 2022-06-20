import 'package:flutter/material.dart';

class ExpirationCard extends StatelessWidget {
  final String expirationTime;
  const ExpirationCard(this.expirationTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Adult Single Trip Bus',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Color(0xff3c3c3c),
                      fontWeight: FontWeight.bold)),
              subtitle: Text('Buffalo, NY\n',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
            ),
            Row(
              children: <Widget>[
                Text('    Expires ' + expirationTime + '\n',
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
