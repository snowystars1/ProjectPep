import 'package:flutter/material.dart';
import 'package:pep_prac/pep.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Pep",
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xdd25D366),

      ),
      home: new pep(),
    );
  }
}