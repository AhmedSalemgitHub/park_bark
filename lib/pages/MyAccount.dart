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
    final user = Provider.of<UserProvider>(context);
    return Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
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
        ),
        FlatButton(
          onPressed: () {
            user.signOut();
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
