import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:park_bark/custom_widgets/HList.dart';
import 'package:park_bark/custom_widgets/Products.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blue,
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/IMG_1266.JPG'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 2.0,
        indicatorBgPadding: 2.0,
        dotColor: Colors.red,
      ),
    );

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
      body: ListView(
        children: <Widget>[
          image_carousel,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
          HList(),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Categories'),
          ),
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
