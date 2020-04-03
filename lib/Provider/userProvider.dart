import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:park_bark/db/FireBaseDBServices.dart';

enum Status { Uninitialized, Authinticated, Authinticating, UnAuthinticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  FireBaseDBServices _userService = FireBaseDBServices();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Status get status => _status;
  FirebaseUser get user => _user;

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authinticated;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.UnAuthinticated;
      notifyListeners();
      print(e);
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      _status = Status.Authinticated;
      notifyListeners();
      FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      Map<String, dynamic> data = {
        "userId": user.uid,
        "name": name,
        "email": email,
      };
      _userService.createUser(user.uid, data);
      return true;
    } catch (e) {
      _status = Status.UnAuthinticated;
      notifyListeners();
      print(e);
      return false;
    }
  }

  Future signOut() async{
    _auth.signOut();
    _status = Status.UnAuthinticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }



  Future _onStateChanged(FirebaseUser user) async{
    if (user == null) {
      _status = Status.UnAuthinticated;
      
    }else {
      _user = user;
      _status = Status.Authinticated;
    }
    notifyListeners();
  }
}
