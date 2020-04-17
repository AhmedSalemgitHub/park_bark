import 'package:flutter/material.dart';
import 'package:park_bark/Provider/filter_provider.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    var filter = Provider.of<FilterProvider>(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "categories : ",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: <Widget>[
                    FilterChip(
                      label: Text("Breed"),
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
                      label: Text("Vaccines"),
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
                      label: Text("Accessories"),
                      onSelected: (bool value) {
                        if (value) {
                          filter.addCategory("Accessories");
                        } else {
                          filter.removeCategory("Accessories");
                        }
                      },
                      selected: filter.categoriesList.contains("Accessories")
                          ? true
                          : false,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
