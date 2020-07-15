import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavEvent.dart';
import 'NavHome.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;

  final tabs = [
    Center(child: NavHome()),
    Center(child: NavEvent()),
    Center(child: Text("Winner List")),
    Center(child: Text("Save Event")),
    Center(child: Text("Profile")),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              title: Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,color: Colors.black),
              title: Text('Search')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,color: Colors.black),
              title: Text('Add')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.save,color: Colors.black),
              title: Text('Save')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black,),
              title: Text('Person')
          )
        ],
        onTap:(index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }

}
