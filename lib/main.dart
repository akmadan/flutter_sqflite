import 'package:flutter/material.dart';
import 'package:flutter_sqflite/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqflite',
      home: Home(),
    );
  }
}
