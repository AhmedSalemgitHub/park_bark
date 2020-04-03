import 'package:flutter/material.dart';
import 'package:park_bark/custom_widgets/Commons.dart';
import 'package:park_bark/db/FireBaseDBServices.dart';
import 'package:park_bark/db/auth.dart';
import 'package:park_bark/pages/Landing.dart';
import 'package:park_bark/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FireBaseDBServices _userServices = FireBaseDBServices();
  Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  var _formEmail;
  var _formPassword;

  var currentUser = "not Signed in";

  Future<FirebaseUser> _handleSignInGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    if (user != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .getDocuments();

      final List<DocumentSnapshot> document = result.documents;
      if (document.length == 0) {
        Firestore.instance.collection("users").document(user.uid).setData({
          "id": user.uid,
          "name": user.displayName,
          "pic": user.photoUrl,
        });
      }
    }

    return user;
  }

  Future<FirebaseUser> _handleSignInEmailAndPassword(
      String _email, String _password) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential =
        EmailAuthProvider.getCredential(email: _email, password: _password);

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    if (user != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .getDocuments();

      final List<DocumentSnapshot> document = result.documents;
      if (document.length == 0) {
        Firestore.instance.collection("users").document(user.uid).setData({
          "id": user.uid,
          "name": user.displayName,
          "pic": user.photoUrl,
        });
      }
    }

    return user;
  }

  doAction(String message) {
    setState(() {
      currentUser = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(
                  color: Colors.grey[350],
                  blurRadius: 20.0
                ),]
              ),
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
                        onSaved: (value) {
                          _formEmail = value;
                        },
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {},
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    _handleSignInGoogle()
                        .then((FirebaseUser user) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage(user))))
                        .catchError((e) => doAction(e.toString()));
                  },
                  child: Text(
                    "Sign in using Google Account",
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
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                  child: Text("Or sign in with ")
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                  child: MaterialButton(
                    onPressed: () async {
                      FirebaseUser user = await auth.googleSignIn();
                      Map<String,dynamic> data = {
                          "userId": user.uid,
                          "name": user.displayName,
                          "photo": user.photoUrl,
                          "email": user.email
                        };
                      if (user != null) {
                        _userServices.createUser(user.uid, data);
                        replaceScreen(context, LandingPage(user));
                      }
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
