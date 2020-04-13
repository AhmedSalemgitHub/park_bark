import 'package:flutter/material.dart';
import 'package:park_bark/Services/firestore_service.dart';

import 'Provider/userProvider.dart';
import 'pages/Landing.dart';
import 'pages/SignUpProvider.dart';
import 'package:provider/provider.dart';
import 'pages/loginWithProvider.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  FirestoreService _db = FirestoreService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        StreamProvider(create: (BuildContext context) => _db.getCategory()),
        StreamProvider(create: (BuildContext context) => _db.getBrand()),
        StreamProvider(create: (BuildContext context) => _db.getProduct()),
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenController(),
      ),
    ),
  );
}


///the screen controller to decide which screen to move to based on 
///the user authintication status.

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
      switch (user.status) {
        case Status.Uninitialized:
          return SignUpProvider();
          break;
        case Status.UnAuthinticated:
        case Status.Authinticating:
          return LogIn();
        case Status.Authinticated:
          return LandingPage(user.user);
        default:
          return LogIn();
      }
  }
}