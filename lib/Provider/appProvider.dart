import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:park_bark/Models/products.dart';
import 'package:park_bark/db/ProducteServices.dart';

class AppProvider with ChangeNotifier {
  Firestore _firestore;
  List<Product> _featuredProducts = [];
  ProductServices _productServices = ProductServices();

  AppProvider(){
    _getFeaturedProducts();
  }

  // AppProvider.initialize() : _firestore = Firestore.instance ;

  //getter
  List<Product> get featuredProducts => _featuredProducts;

  void _getFeaturedProducts() async{
    _featuredProducts = await _productServices.getFeaturedProducts();
    notifyListeners();
  }
}