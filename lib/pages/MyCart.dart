import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {

  var prods = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer2.jpeg",
      "price": 115
    },    {
      "name": "Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 200
    },
  ];

  int _calculateTotal(){
    int result = 0;
    prods.forEach((element) {result += element["price"];});
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: prods.length,
          itemBuilder: (context,int index){
            return CartItem(
              productName: prods[index]["name"],
              productPicture: prods[index]["picture"],
              productPrice: prods[index]["price"],
            );
          }
      ),
      bottomNavigationBar: Container(
        color: Colors.grey,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(title: Text("Total"),subtitle: Text("\$${_calculateTotal()}"),)),
            Expanded(child: ListTile(title: Text("items count"),subtitle: Text("${prods.length}"),)),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(color: Colors.blue,child: Text("Check Out"),onPressed: (){},),
            )),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final productName;
  final productPicture;
  final productPrice;

  //constructor
  CartItem(
      {this.productName,
        this.productPicture,
        this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("$productName"),
        subtitle: Text("\$$productPrice"),
        leading: Image.asset(productPicture),
      ),
    );
  }
}

