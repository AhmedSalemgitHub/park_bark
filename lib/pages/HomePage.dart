import 'package:flutter/material.dart';
import 'package:park_bark/Models/products.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    return Scaffold(
      appBar: AppBar(),
      body: products == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: products.length ?? 1,
              itemBuilder: (context, index) {
                print(products.length);
                return Stack(
                  children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0)
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: Image.network(
                            products[index].picture,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.blue])),
                      ),
                    ),
                  ],
                );
              }),

      // Column(
      //   children: <Widget>[
      //   //  imageCarousel,
      //     // Container(
      //     //   alignment: Alignment.center,
      //     //   width: double.infinity,
      //     //   padding: EdgeInsets.all(4.0),
      //     //   child: Text(
      //     //     'Categories',
      //     //   ),
      //     // ),
      //     // //HList(),
      //     // Container(
      //     //   alignment: Alignment.center,
      //     //   width: double.infinity,
      //     //   padding: EdgeInsets.all(4.0),
      //     //   child: Text(
      //     //     'Recent',
      //     //   ),
      //     // ),
      //     Flexible(
      //       child: Products(),
      //     ),
      //   ],
      // ),
    );
  }
}
