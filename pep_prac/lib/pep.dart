import 'package:flutter/material.dart';
import 'package:pep_prac/pages/friends.dart';
import 'package:pep_prac/pages/map.dart';
import 'package:pep_prac/pages/profile.dart';

class pep extends StatefulWidget {
  @override
  pepState createState() => pepState();
}

class pepState extends State<pep>
    with SingleTickerProviderStateMixin{
      TabController _tabController;
      @override
      void initState() {
    // TODO: implement initState
        super.initState();
        _tabController = new TabController(vsync: this, initialIndex: 1, length: 3);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //backgroundColor: Colors.black, // background color
        appBar: AppBar(
          title: const Text('Pep'),
          bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.people)),
              Tab(icon: Icon(Icons.satellite)),
              Tab(icon: Icon(Icons.face)
              ),

            ],
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new friends(),
            new map(),
            new profile(),

          ],
        ),
        floatingActionButtonLocation: // set locaiton for the floating Actionbutton
        FloatingActionButtonLocation.centerDocked,
          floatingActionButton: new FloatingActionButton(
            backgroundColor: Theme.of(context).accentColor,
            child: const Icon(Icons.message),
            onPressed: ()=> print("open chat"),
        ),

      bottomNavigationBar: new BottomAppBar(
        color: Colors.grey,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0, // this is where i made the notch
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {},),
            IconButton(icon: Icon(Icons.search), onPressed: () {},),
          ],
        ),

      )
    );
  }
}
