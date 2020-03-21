import 'package:flutter/material.dart';
import 'package:park_bark/pages/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blue,
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: LogIn(),
    ),
  );
}


