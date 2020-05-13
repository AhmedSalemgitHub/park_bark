import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_bark/Models/products.dart';
import 'package:park_bark/pages/order_page.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    return Scaffold(
        body: ListView(
          children: [
            Card(
              color: Color.fromRGBO(0, 30, 70, 1),
              child: Container(
                height: 180,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Welcome to Bark Park",
                    style:
                        GoogleFonts.fredokaOne(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: products == null
                  ? CircularProgressIndicator()
                  : GridView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: products.length ?? 1,
                      itemBuilder: (context, index) {
                        return Container(
                            child: Card(
                          child: CustomGridItem(product: products[index]),
                        ));
                      }),
            ),
          ],
        ));
  }
}

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => OrderPage()));
      },
      child: GridTile(
        header: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              product.name,
              style: GoogleFonts.anton(fontSize: 15, color: Colors.black),
            ),
          ),
          color: Colors.white54,
        ),
        footer: Container(
          child: Text(
            "EGP ${product.price}",
            textAlign: TextAlign.center,
            style: GoogleFonts.indieFlower(
                fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          color: Colors.white70,
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CachedNetworkImage(
              imageUrl: product.picture,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
