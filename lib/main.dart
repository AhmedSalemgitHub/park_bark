import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/brand.dart';
import 'Models/products.dart';
import 'Models/categoty.dart';
import 'Provider/filter_provider.dart';
import 'Provider/userProvider.dart';
import 'pages/Landing.dart';
import 'pages/loginWithProvider.dart';
import 'Services/firestore_service.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  FirestoreService _db = FirestoreService();

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseUser curretntUser = await  auth.currentUser();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider<FilterProvider>(create: (BuildContext context) => FilterProvider()),
        StreamProvider<List<Category>>(create: (BuildContext context) => _db.getCategory()),
        StreamProvider<List<Brand>>(create: (BuildContext context) => _db.getBrand()),
        StreamProvider<List<Product>>(create: (BuildContext context) => _db.getProduct()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _db == null ? CircularProgressIndicator() :
        
        curretntUser == null
            ? LogIn()
            : LandingPage(),
      ),
    ),
  );
}

