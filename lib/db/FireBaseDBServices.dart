import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseDBServices {
  Firestore _firestore = Firestore.instance;
  String collection = "users";

  createUser(String uid,Map value) {
    _firestore
        .collection(collection)
        .document(uid)
        .setData(value)
        .catchError((e) => {print(e.toString())});
  }
}
