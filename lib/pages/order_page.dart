import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Please call us on phone number \n01000000000 \nto pace your order , and you may visit our facebook page: \n'bark park'",
                style: TextStyle(fontSize: 30,color: Colors.amber),
                textAlign: TextAlign.center,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
