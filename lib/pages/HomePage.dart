import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_bark/Models/products.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    return Scaffold(
      appBar: AppBar(),
      body: products == null
          ? CircularProgressIndicator()
          : GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: products.length ?? 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      //width: MediaQuery.of(context).size.width/2,
                      //height: 200,
                      child: Card(
                    child: GridTile(
                      header: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(
                            products[index].name,
                            style: GoogleFonts.lobster(fontSize: 15,color: Colors.blue),
                          ),
                        ),
                        color: Colors.white70,
                      ),
                      footer: Container(
                        child: Text(
                          "EGP ${products[index].price}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dancingScript(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),
                        ),
                        color: Colors.white70,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: products[index].picture,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  )),
                );
              }),
    );
  }
}
