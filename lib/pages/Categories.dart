import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_bark/Models/products.dart';
import 'package:park_bark/Provider/filter_provider.dart';
import 'package:park_bark/pages/order_page.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    var filter = Provider.of<FilterProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "categories : ",
              style: GoogleFonts.righteous(fontSize: 20, color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: <Widget>[
                        FilterChip(
                          backgroundColor: Colors.amber,
                          checkmarkColor: Colors.red,
                          selectedColor: Colors.greenAccent,
                          label: Text(
                            "Breed",
                            style: GoogleFonts.righteous(
                                fontSize: 20, color: Colors.blue),
                          ),
                          onSelected: (bool value) {
                            if (value) {
                              filter.addCategory("Breed");
                            } else {
                              filter.removeCategory("Breed");
                            }
                          },
                          selected: filter.categoriesList.contains("Breed")
                              ? true
                              : false,
                        ),
                        FilterChip(
                          backgroundColor: Colors.amber,
                          checkmarkColor: Colors.red,
                          selectedColor: Colors.greenAccent,
                          label: Text(
                            "Vaccines",
                            style: GoogleFonts.righteous(
                                fontSize: 20, color: Colors.blue),
                          ),
                          onSelected: (bool value) {
                            if (value) {
                              filter.addCategory("Vaccines");
                            } else {
                              filter.removeCategory("Vaccines");
                            }
                          },
                          selected: filter.categoriesList.contains("Vaccines")
                              ? true
                              : false,
                        ),
                        FilterChip(
                          backgroundColor: Colors.amber,
                          checkmarkColor: Colors.red,
                          selectedColor: Colors.greenAccent,
                          label: Text(
                            "Accessories",
                            style: GoogleFonts.righteous(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                          onSelected: (bool value) {
                            if (value) {
                              filter.addCategory("Accessories");
                            } else {
                              filter.removeCategory("Accessories");
                            }
                          },
                          selected:
                              filter.categoriesList.contains("Accessories")
                                  ? true
                                  : false,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            child: products == null
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: products.length ?? 1,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text(products[index].name),
                        subtitle: Text("EGP ${products[index].price}"),
                        leading: CachedNetworkImage(
                          imageUrl: products[index].picture,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => OrderPage()));
      },
                      ));
                    },
                  ),
          )
        ],
      ),
    );
  }
}
