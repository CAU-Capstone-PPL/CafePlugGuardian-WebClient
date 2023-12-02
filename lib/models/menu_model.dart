class MenuModel {
  final String name, description;
  final int id, price;

  MenuModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.description});

  MenuModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'];
}
