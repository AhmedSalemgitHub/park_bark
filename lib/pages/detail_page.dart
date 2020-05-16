import 'package:flutter/material.dart';
import 'package:park_bark/Models/products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:park_bark/pages/order_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({this.product, Key key}) : super(key: key);

  // static const ID = "id";
  // static const BRAND = "brand";
  // static const CATEGORY = "category";
  // static const FEATURED = "featured";

  final Product product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              productPicture(),
              SizedBox(height: 10),
              productPrice(),
              SizedBox(height: 10),
              productDescription(),
              SizedBox(height: 10),
              orderButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget productPicture() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              child: CachedNetworkImage(
                imageUrl: product.picture,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget productPrice() {
    return Text(
      "EGP ${product.price}",
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }

  Widget productDescription() {
    return Card(
      child: ListTile(
        title: Text("${product.name}"),
        subtitle: Text("${product.description}"),
      ),
    );
  }

  Widget orderButton(context) {
    return MaterialButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
      },
      minWidth: MediaQuery.of(context).size.width/2,
      child: Text("ORDER"),
      color: Colors.blue,
      elevation: 1,
      
    );
  }
}
