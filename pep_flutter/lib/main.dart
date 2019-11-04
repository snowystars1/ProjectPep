import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // function with only one expression we can use =>

class MyApp extends StatelessWidget{
  void answerQuestion() {
    //print("ANswer chosen!");
  }
  @override
  Widget build(BuildContext context)   {
    var pages = [
      'This will lead to the a page',
      "This will lead to another page",
    ];
    return MaterialApp(home:Scaffold(
      appBar: AppBar(
          title: const Text('Pep'),

      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {},),
            IconButton(icon: Icon(Icons.search), onPressed: () {},),
          ],
        ),
      ),
      body: Column(
          children:[Text("hello")],
        ),
      ),
    ); //makes it look like regular app
  }
}