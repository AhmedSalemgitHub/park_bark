import 'package:flutter/material.dart';
import 'package:park_bark/Provider/userProvider.dart';
import 'package:park_bark/custom_widgets/Commons.dart';
import 'package:park_bark/pages/loginWithProvider.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return userProvider.user == null
        ? UserErrorPage()
        : MainPage(userProvider: userProvider);
  }
}

class UserErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Some Thing went wrong please login again",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
              color: Colors.red,
              onPressed: () {
                userProvider.signOut();
                replaceScreen(context, LogIn());
              },
              child: Text("Go To Log in Page ",style: TextStyle(color: Colors.blue),))
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key key,
    @required this.userProvider,
  }) : super(key: key);

  final UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("${userProvider.user.displayName}"),
          accountEmail: Text("${userProvider.user.email}"),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: userProvider.user.photoUrl != null
                  ? Image.network(userProvider.user.photoUrl)
                  : Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
            ),
          ),
          decoration: BoxDecoration(color: Colors.blue),
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
