// Copyright 2018 - 2019, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shamsi_date example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // this is a formatter function for Jalali or Georgian dates
  // which are subclass of Date
  String _format(Date d) {
    final f = d.formatter;

    return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
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
              // Here we format today in jalali
              _format(Jalali.now()),
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(height: 16),
            Text(
              // Here we format today in Georgian
              _format(Gregorian.now()),
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
