import 'package:flutter/material.dart';
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

  Future<FirebaseUser> _handleSignInEmailAndPassword(String _email, String _password) async {
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
      appBar: AppBar(
        title: Text("Welcoem"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
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
                ],
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
                  child: Text("Sign In"),
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
                  child: Text("Sign in using Google Account"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                child: Text("Sign Up"),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
