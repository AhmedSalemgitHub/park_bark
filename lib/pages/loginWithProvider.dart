import 'package:flutter/material.dart';
import 'package:park_bark/Provider/userProvider.dart';
import 'package:park_bark/Services/firestore_service.dart';
import 'package:park_bark/custom_widgets/Commons.dart';
import 'package:park_bark/pages/SignUpProvider.dart';
import 'package:provider/provider.dart';

import 'Landing.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldstateKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  //var currentUser = "not Signed in";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _scaffoldstateKey,
      body: user.status == Status.Authinticating
          ? CircularProgressIndicator()
          : ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.grey[350], blurRadius: 20.0),
                        ]),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 60,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'please enter your e-mail';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "email",
                                  icon: Icon(Icons.email),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'please enter your password';
                                } else if (value.length < 6) {
                                  return 'password must be more than 6 charcters';
                                } else {
                                  return null;
                                }
                              },
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                              child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    if (!await user.signIn(
                                        _emailTextController.text,
                                        _passwordTextController.text)) {
                                      _scaffoldstateKey.currentState
                                          .showSnackBar(SnackBar(
                                              content: Text("Sign in failed")));
                                    } else {
                                      replaceScreen(context, LandingPage());
                                    }
                                  }
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 8.0),
                            child: InkWell(
                              child: Text(
                                "Do not have account ? Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUpProvider()));
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                                  child: Text("Or sign in with ")),
                              Padding(
                                padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                                child: MaterialButton(
                                  onPressed: () async {
                                    user.signInGoogle().whenComplete(() {
                                      replaceScreen(context, LandingPage());
                                    });
                                  },
                                  child: Image.asset(
                                    "images/fb.png",
                                    width: 80,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}