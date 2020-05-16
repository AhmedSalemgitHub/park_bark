import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  //String _category;
  List<String> _categoriesList;

  FilterProvider(){
    _categoriesList = ['Breed','Vaccines','Accessories'];
  }

  //getters
  List<String> get categoriesList => _categoriesList;

  // //setters
  // void _setCategoriesList(List<String> categoresList){
  //   _categoriesList = categoresList;
  //   notifyListeners();
  // }

  void addCategory(String category){
    if (!_categoriesList.contains(category)) {
      _categoriesList.add(category);
      notifyListeners();
    }
  }
  
  void removeCategory(String category){
    if (_categoriesList.contains(category)) {
      _categoriesList.remove(category);
      notifyListeners();
    }
  }

  
}