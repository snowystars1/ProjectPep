import 'package:flutter/material.dart';
import 'package:pep2/pages/chat.dart';
import 'package:pep2/pages/hub.dart';
import 'package:pep2/pages/home.dart';

class start extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<start> {
  int selectedpage = 0;
  final _pageOptions = [
    chat(),
    home(),
    hub(),
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        ),
    home: Scaffold(
      appBar: AppBar(title: Text("Bottom nav"),),
      body: _pageOptions[selectedpage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedpage,
        onTap: (int index) {
          setState(() {
            selectedpage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('chat')

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home')

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('hub')

          ),
        ],
      ),
    )
    );
  }
}