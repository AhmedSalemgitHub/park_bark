import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:park_bark/Models/products.dart';

class ProductServices {
  Firestore _firestore = Firestore.instance;
  String collection = "products";

  Future<List<Product>> getFeaturedProducts() =>
    _firestore.collection(collection).where('featured',isEqualTo: true).getDocuments().then((snap){
      List<Product> featuredProducts = [];
      snap.documents.map((snapshot)=> featuredProducts.add(Product.fromSnapShot(snapshot)));
      return featuredProducts;
    });
}