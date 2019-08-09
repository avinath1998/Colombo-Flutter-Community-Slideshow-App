import 'package:flutter/material.dart';
import 'package:flutter_cmb_meetup/screens/screen_root.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Colombo Flutter Meetup',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.blue,
          buttonColor: Colors.blue,
          fontFamily: 'Poppins',
          textTheme: TextTheme(
              button: TextStyle(color: Colors.white, fontSize: 15.0),
              headline: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
              subhead: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              subtitle: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              body1: TextStyle(fontSize: 14.0),
              display4: TextStyle(fontSize: 15.0, color: Colors.black)
          ),
        ),
        home: ScreenRoot()
    );
  }
}