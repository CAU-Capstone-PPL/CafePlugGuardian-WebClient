class Menu {
  final String name, describe;
  final int price;

  Menu({required this.name, required this.price, required this.describe});

  Menu.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'],
        describe = json['describe'];
}
