import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '猜大小', //应用名称
      theme: ThemeData(
          primarySwatch: Colors.lightBlue),
      home: MyHomePage(),
    );
  }
}