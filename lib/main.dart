import 'package:f_f1_faisal_alshikh/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqflite DB',
      home: HomePage(),
    );
  }
}