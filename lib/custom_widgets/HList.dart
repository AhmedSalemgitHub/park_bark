import 'package:flutter/material.dart';

class HList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        itemExtent: 100.0,
        children: <Widget>[
          Category(image_location:'images/cats/accessories.png',image_caption:'Accessories'),
          Category(image_location:'images/cats/dress.png',image_caption:'Dress'),
          Category(image_location:'images/cats/formal.png',image_caption:'Formal'),
          Category(image_location:'images/cats/informal.png',image_caption:'Informal'),
          Category(image_location:'images/cats/jeans.png',image_caption:'Jeans'),
          Category(image_location:'images/cats/shoe.png',image_caption:'Shoe'),
          Category(image_location:'images/cats/tshirt.png',image_caption:'T-Shirt'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location,this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2.0),child: InkWell(
      onTap: (){},
      child: Column(
        children: <Widget>[
          Image.asset(image_location,width: 60,height: 60,),
          Text(image_caption)
        ],
      ),
    ),);
  }
}

