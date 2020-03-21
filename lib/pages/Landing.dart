import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_bark/pages/Categories.dart';
import 'package:park_bark/pages/HomePage.dart';
import 'package:park_bark/pages/MyCart.dart';
import 'package:park_bark/pages/MyAccount.dart';
import 'package:park_bark/pages/More.dart';
import 'package:park_bark/pages/login.dart';

class LandingPage extends StatefulWidget {
  final FirebaseUser user;
  LandingPage(this.user);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[HomePage(),Categories(),MyCart(),MyAccount(widget.user),More()];
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,),title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.category,),title: Text('Category')),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket,),title: Text('cart')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle,),title: Text('account')),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz,),title: Text('more')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 20,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: null,
        elevation: 10,
      ),
    );
  }
}