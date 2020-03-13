import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return         UserAccountsDrawerHeader(
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
    );
  }
}
