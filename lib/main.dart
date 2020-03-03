import 'package:flutter/material.dart';
import 'package:park_bark/pages/Categories.dart';
import 'package:park_bark/pages/HomePage.dart';
import 'package:park_bark/pages/MyCart.dart';
import 'package:park_bark/pages/MyAccount.dart';
import 'package:park_bark/pages/More.dart';


void main() {
  runApp(
    MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blue,
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(color: Colors.blueAccent,),
      ),
      home: LandingPage(),
    ),
  );
}

class LandingPage extends StatefulWidget {
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
    List<Widget> _pages = <Widget>[HomePage(),Categories(),MyCart(),MyAccount(),More()];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bark Park'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ahmed Hassan Salem'),
              accountEmail: Text('Ahmedsalem.developer@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text('Home Page'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: Text('My Account'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
              title: Text('My Orders'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.category,
                color: Colors.red,
              ),
              title: Text('Categories'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('Favorites'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
              title: Text('About'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blueAccent,),title: Text('Home',style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.category,color: Colors.blueAccent,),title: Text('Category',style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket,color: Colors.blueAccent,),title: Text('cart',style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle,color: Colors.blueAccent,),title: Text('account',style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz,color: Colors.blueAccent,),title: Text('more',style: TextStyle(color: Colors.black),)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
