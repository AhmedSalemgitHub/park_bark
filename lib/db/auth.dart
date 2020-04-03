import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

abstract class BaseAuth{
  Future<FirebaseUser> googleSignIn();
}

class Auth implements BaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  @override
  Future<FirebaseUser> googleSignIn() async{
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount _googleAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleAuth = await _googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: _googleAuth.idToken, 
      accessToken: _googleAuth.accessToken
      );

    try {
      FirebaseUser user = (await _firebaseAuth.signInWithCredential(credential)).user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }


  
}