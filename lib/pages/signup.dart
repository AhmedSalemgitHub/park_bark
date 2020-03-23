import 'package:flutter/material.dart';
import 'package:park_bark/pages/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

    final _formKey = GlobalKey<FormState>();

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
                          icon: Icon(Icons.contacts),
                          border: OutlineInputBorder()),
                    ),
                  ),
// #### the email field
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
// #### the password field
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
                  child: Text("Sign Up"),
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
      ),
    );
  }
}