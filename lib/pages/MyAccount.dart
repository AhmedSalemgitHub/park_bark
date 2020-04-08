import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_bark/Provider/userProvider.dart';
import 'package:park_bark/custom_widgets/Commons.dart';
import 'package:park_bark/pages/loginWithProvider.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  final FirebaseUser user;
  MyAccount(this.user);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("${userProvider.user.displayName}"),
          accountEmail: Text("${userProvider.user.email}"),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: widget.user.photoUrl != null
                  ? Image.network(userProvider.user.photoUrl)
                  : Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
            ),
          ),
          decoration: BoxDecoration(color: Colors.red),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "UID:",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                userProvider.user.uid,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        FlatButton(
          onPressed: () {
            userProvider.signOut();
            replaceScreen(context, LogIn());
          },
          child: Text('Sign out'),
          color: Colors.redAccent[700],
          textColor: Colors.white,
        )
      ],
    );
  }
}
