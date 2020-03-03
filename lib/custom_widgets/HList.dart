import 'package:flutter/material.dart';

class HList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        itemExtent: 80.0,
        children: <Widget>[
          Category(imageLocation:'images/cats/accessories.png',imageCaption:'Accessories'),
          Category(imageLocation:'images/cats/dress.png',imageCaption:'Dress'),
          Category(imageLocation:'images/cats/formal.png',imageCaption:'Formal'),
          Category(imageLocation:'images/cats/informal.png',imageCaption:'Informal'),
          Category(imageLocation:'images/cats/jeans.png',imageCaption:'Jeans'),
          Category(imageLocation:'images/cats/shoe.png',imageCaption:'Shoe'),
          Category(imageLocation:'images/cats/tshirt.png',imageCaption:'T-Shirt'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageLocation,this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2.0),child: InkWell(
      onTap: (){},
      child: Column(
        children: <Widget>[
          Image.asset(imageLocation,height: 70,),
          Padding(padding : EdgeInsets.all(2.0)),
          Text(imageCaption,style: TextStyle(fontSize: 12),)
        ],
      ),
    ),);
  }
}

