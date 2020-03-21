import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  final FirebaseUser user;
  MyAccount(this.user);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return         UserAccountsDrawerHeader(
      accountName: Text(widget.user.displayName),
      accountEmail: Text(widget.user.email),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Image.network(widget.user.photoUrl)
          //Icon(Icons.person,color: Colors.white,),
        ),
      ),
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
