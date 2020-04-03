import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:park_bark/Provider/userProvider.dart';
import 'package:park_bark/custom_widgets/HList.dart';
import 'package:park_bark/custom_widgets/Products.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Widget imageCarousel = new Container(
    height: 180.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/c1.jpg'),
        AssetImage('images/m1.jpeg'),
        AssetImage('images/w1.jpeg'),
        AssetImage('images/w4.jpeg'),
        AssetImage('images/w3.jpeg'),
        AssetImage('images/m2.jpg'),
        AssetImage('images/IMG_1266.JPG'),
      ],
      autoplay: true,
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
      dotColor: Colors.blue,
      dotBgColor: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          imageCarousel,
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.all(4.0),
            child: Text('Categories',),
          ),
          HList(),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.all(4.0),
            child: Text('Recent',),
          ),
          Flexible(
            child: Products(),
          ),
        ],
      ),
    );
  }
}
