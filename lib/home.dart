import 'package:flutter/material.dart';
import 'package:flutter_sqflite/db/dbHelper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLITE'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  int i = await DatabaseHelper.instance
                      .insertFunction({DatabaseHelper.colName: 'Akshit'});

                  print('Inserted ID is: $i');
                },
                child: Text('Insert')),
            TextButton(
                onPressed: () async {
                  List<Map<String, dynamic>> queryrows =
                      await DatabaseHelper.instance.queryAllFunction();
                  print(queryrows);
                },
                child: Text('Query')),
          ],
        ),
      ),
    );
  }
}
