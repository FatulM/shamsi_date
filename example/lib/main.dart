import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  runApp(MaterialApp(
    title: 'Example for shamsi_date package',
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gregorian get g {
    final now = DateTime.now();
    return Gregorian(now.year, now.month, now.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example for shamsi_date package'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$g in Gregorian is ${g.toJalali()} in Jalali',
            ),
          ],
        ),
      ),
    );
  }
}
