import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:park_bark/db/auth.dart';
import 'package:park_bark/pages/Landing.dart';
import 'package:park_bark/pages/login.dart';
import '../db/FireBaseDBServices.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  FireBaseDBServices _userServices = FireBaseDBServices();
  Auth auth = Auth();

  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  var _formUserName = "";
  var _formEmail = "";
  var _formPassword = "";

  var currentUser = "not Signed in";

  doAction(String message) {
    setState(() {
      currentUser = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
// #### The Intro Welcome Text #### //
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,32.0,8.0,8.0),
                  child: Text("Welcome",style: TextStyle(fontSize: 30.0,color: Colors.blueGrey)),
                ),
// #### The Intro Icon #### //
                Padding(padding: EdgeInsets.all(8.0),
                child: CircleAvatar(radius: 70.0,child: Icon(Icons.archive),),),
// #####  the field of the user name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _formUserName = value;
                    },
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
                    onSaved: (value) {
                      _formEmail = value;
                    },
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
                    onSaved: (value) {
                      _formPassword = value;
                    },
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
                  validateForm();
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              child: Text("Already Have Account? login"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LogIn()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> validateForm() async {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      FirebaseUser user = await _auth.currentUser();
      if (user == null) {
        _auth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then((value) => {
                  _userServices.createUser(user.uid, {
                    "id": user.uid,
                    "username": user.displayName,
                    "email": user.email,
                  })
                })
            .catchError((err) => {print(err.toString())})
            .whenComplete(() => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LandingPage(user)))
                });
      }
    }
  }
}
