import 'package:flutter/material.dart';
import 'package:park_bark/Models/user.dart';
import 'package:park_bark/Provider/userProvider.dart';
import 'package:park_bark/Services/firestore_service.dart';
import 'package:park_bark/custom_widgets/Commons.dart';
import 'package:park_bark/pages/loginWithProvider.dart';
import 'package:provider/provider.dart';
import 'Landing.dart';

class SignUpProvider extends StatefulWidget {
  @override
  _SignUpProviderState createState() => _SignUpProviderState();
}

class _SignUpProviderState extends State<SignUpProvider> {
  FirestoreService _db = FirestoreService();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldstateKey = GlobalKey<ScaffoldState>();
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserProvider>(context);

    return Scaffold(
        key: _scaffoldstateKey,
        body: Center(
          child: _user.status == Status.Authinticating
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
// #### The Intro Icon #### //
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 60,
                                child: Image.asset('assets/images/icon.png'),
                                backgroundColor: Colors.amber,
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
                                if (!await _user.signUp(
                                    _userNameTextController.text,
                                    _emailTextController.text,
                                    _passwordTextController.text)) {
                                  _scaffoldstateKey.currentState.showSnackBar(
                                      SnackBar(
                                          content: Text("Sign up failed")));
                                } else {
                                  _db.addUser(
                                      _user.user.uid,
                                      User.toJson(
                                          age: 0,
                                          email: _user.user.email,
                                          id: _user.user.uid,
                                          name: _userNameTextController.text,
                                          orders: [],
                                          phone: '',
                                          photo: '',
                                          registerMethod: 'email',
                                          reviews: [],
                                          userCart: []));
                                  replaceScreen(context, LandingPage());
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
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LogIn()));
                          },
                        ),
                      ),
// #### Google login button ### //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Or sign in with ",
                            style: TextStyle(fontSize: 20),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              _user.signInGoogle().whenComplete(() {
                                replaceScreen(context, LandingPage());
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "images/google.png",
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Google",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ));
  }
}
