import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
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
    );
  }
}
