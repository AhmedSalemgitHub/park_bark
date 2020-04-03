import 'package:flutter/material.dart';
import 'package:park_bark/Provider/userProvider.dart';
import 'package:park_bark/pages/Landing.dart';
import 'package:park_bark/pages/SignUpProvider.dart';
import 'package:park_bark/pages/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider.initialize(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenController(),
      ),
    ),
  );
}

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