import 'package:cardinput/cardForm.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Card Input",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("Card Input"),
        ),
        body: Container(
          child: cardForm(),
        ),
      ),
    );
  }
}