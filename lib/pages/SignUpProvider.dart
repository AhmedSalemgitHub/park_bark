import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_bark/Provider/userProvider.dart';
import 'package:park_bark/custom_widgets/Commons.dart';
import 'package:park_bark/pages/loginWithProvider.dart';
import 'package:provider/provider.dart';
import 'Landing.dart';

class SignUpProvider extends StatefulWidget {
  @override
  _SignUpProviderState createState() => _SignUpProviderState();
}

class _SignUpProviderState extends State<SignUpProvider> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldstateKey = GlobalKey<ScaffoldState>();
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _scaffoldstateKey,
      body: user.status == Status.Authinticating
          ? CircularProgressIndicator()
          : ListView(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
// #### The Intro Welcome Text #### //
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                        child: Text("Welcome",
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.blueGrey)),
                      ),
// #### The Intro Icon #### //
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          child: Icon(Icons.archive),
                        ),
                      ),
// #####  the field of the user name
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _userNameTextController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter your user name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "User Name",
                              icon: Icon(Icons.person),
                              border: OutlineInputBorder()),
                        ),
                      ),
// #### the email field ### //
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _emailTextController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter your user name';
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
// #### the password field ### //
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
                    ],
                  ),
                ),
// #### the register button ### //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          if (!await user.signUp(
                              _userNameTextController.text,
                              _emailTextController.text,
                              _passwordTextController.text)) {
                            _scaffoldstateKey.currentState.showSnackBar(
                                SnackBar(content: Text("Sign up failed")));
                          } else {
                            replaceScreen(context, LandingPage(user.user));
                          }
                        }
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
// #### the text ### //
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text(
                      "Already Have Account? login",
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LogIn()));
                    },
                  ),
                ),
// #### Google login button ### //
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
                          FirebaseUser googleUser = await user.signInGoogle();
                          replaceScreen(context, LandingPage(googleUser));
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
    );
  }
}
