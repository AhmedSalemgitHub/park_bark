import 'package:flutter/material.dart';
import 'package:park_bark/pages/Categories.dart';
import 'package:park_bark/pages/HomePage.dart';
import 'package:park_bark/pages/MyAccount.dart';
import 'package:park_bark/pages/under_construction.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      HomePage(),
      Categories(),
      UnderConstruction(),
      //MyCart(),
      MyAccount()
    ];
    return SafeArea(
      child: Scaffold(
        body: Container(child: _pages.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text('Home',)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                title: Text('Category')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket,
                ),
                title: Text('cart')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                title: Text('account')),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          iconSize: 24,
          selectedItemColor: Colors.brown[900],
          unselectedItemColor: Colors.blue[100],
          selectedFontSize: 12,
          unselectedFontSize: 11,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: null,
          unselectedLabelStyle: null,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.brown[200],
          
        ),
      ),
    );
  }
}
