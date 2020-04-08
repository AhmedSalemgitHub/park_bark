import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_bark/pages/Categories.dart';
import 'package:park_bark/pages/HomePage.dart';
import 'package:park_bark/pages/MyCart.dart';
import 'package:park_bark/pages/MyAccount.dart';
import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';

class LandingPage extends StatefulWidget {
  final FirebaseUser user;
  LandingPage(this.user);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      HomePage(),
      Categories(),
      MyCart(),
      MyAccount(widget.user)
    ];
    return SafeArea(
      child: Scaffold(
        body: _source.keys.toList()[0] == ConnectivityResult.none
            ? Center(
                child: Container(
                    child: Text(
                  "No Internet Connection",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                )),
              )
            : _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text('Home')),
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
      ),
    );
  }
}

class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}
