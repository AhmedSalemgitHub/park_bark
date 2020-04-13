class Brand {
  final String id;
  final String name;

  Brand({this.id,this.name});

  Brand.fromJson(Map<String,dynamic> data) :
    id = data["id"],
    name = data["name"];
}