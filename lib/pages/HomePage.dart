import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:park_bark/custom_widgets/HList.dart';
import 'package:park_bark/custom_widgets/Products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget image_carousel = new Container(
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
      autoplay: false,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
      dotColor: Colors.blue,
      dotBgColor: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bark Park'),
      ),
      body: Column(
        children: <Widget>[
          image_carousel,
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.deepPurple,
            padding: EdgeInsets.all(4.0),
            child: Text('Categories',style: TextStyle(color: Colors.red),),
          ),
          HList(),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.deepPurple,
            padding: EdgeInsets.all(4.0),
            child: Text('Recent',style: TextStyle(color: Colors.red),),
          ),
          Flexible(
            child: Products(),
          ),
        ],
      ),
    );
  }
}
