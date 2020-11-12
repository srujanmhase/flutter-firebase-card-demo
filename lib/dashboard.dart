import 'package:card_demo/screens/profile.dart';
import 'package:card_demo/screens/sccards.dart';
import 'package:card_demo/screens/ycards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homepage.dart';
import 'routes.dart';
import 'widgetassets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authservice.dart';
import 'screens/ycards.dart';

class dashboardState extends StatefulWidget {
  dashboardState({Key key}) : super(key: key);

  @override
  _dashboardStateState createState() => _dashboardStateState();
}

class _dashboardStateState extends State<dashboardState> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ycards(),
    sccards(),
    profileDash(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 70,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: headerLogo()),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: GoogleUserCircleAvatar(
                          identity: currentUser,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            title: Text('Your Cards'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            title: Text('Scanned Cards'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
