class Product {
  static const ID = "id";
  static const NAME = "name";
  static const PRICE = "price";
  static const BRAND = "brand";
  static const CATEGORY = "category";
  static const DESCREPTION = "description";
  static const PICTURE = "picture";
  static const FEATURED = "featured";

  String _id;
  String _name;
  double _price;
  String _brand;
  String _category;
  String _description;
  String _picture;
  bool _featured;

  //getters
  String get id => _id;
  String get name => _name;
  double get price => _price;
  String get brand => _brand;
  String get category => _category;
  String get description => _description;
  String get picture => _picture;
  bool get featured => _featured;

  // constructor
  Product.fromJson(Map<String,dynamic> data) {
    _id = data[ID];
    _name = data[NAME];
    _price = data[PRICE];
    _brand = data[BRAND];
    _category = data[CATEGORY];
    _description = data[DESCREPTION];
    _picture = data[PICTURE];
    _featured = data[FEATURED];
  }
}
