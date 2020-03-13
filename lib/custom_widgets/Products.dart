import 'package:flutter/material.dart';
import 'package:park_bark/pages/ProductDetails.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "oldPrice": 120,
      "price": 85
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer2.jpeg",
      "oldPrice": 100,
      "price": 50
    },
    {
      "name": "Dress",
      "picture": "images/products/dress1.jpeg",
      "oldPrice": 200,
      "price": 180
    },
    {
      "name": "Dress",
      "picture": "images/products/dress2.jpeg",
      "oldPrice": 320,
      "price": 250
    },
    {
      "name": "Hills1",
      "picture": "images/products/hills1.jpeg",
      "oldPrice": 80,
      "price": 50
    },
    {
      "name": "Hills",
      "picture": "images/products/hills2.jpeg",
      "oldPrice": 70,
      "price": 65
    },
    {
      "name": "shoe",
      "picture": "images/products/shoe1.jpg",
      "oldPrice": 150,
      "price": 120
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['oldPrice'],
            productPrice: productList[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;

  //constructor
  SingleProduct(
      {this.productName,
      this.productPicture,
      this.productOldPrice,
      this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productPicture,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                  productDetailName: productName,
                  productDetailPicture: productPicture,
                  productDetailPrice: productPrice,
                  productDetailOldPrice: productOldPrice,
                ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text(productName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),),
                    Text("\$${productPrice}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16.0),)
                  ],
                )
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
