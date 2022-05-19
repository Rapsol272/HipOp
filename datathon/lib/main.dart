import 'package:datathon/home_page.dart';
import 'package:datathon/question_page.dart';
import 'package:datathon/result_page.dart';
import 'package:flutter/material.dart';

const String q1 = "Q1";
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //use MaterialApp() widget like this
        home: Home() //create new widget class for this 'home' to
        // escape 'No MediaQuery widget found' error
        );
  }
}

//create new class for "home" property of MaterialApp()
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
