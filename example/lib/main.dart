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
              'now is ${Jalali.now()} in Jalali',
            ),
            Text(
              'now is ${Gregorian.now()} in Gregorian',
            ),
          ],
        ),
      ),
    );
  }
}
