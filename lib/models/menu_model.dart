class MenuModel {
  final String menuName, menuDescription;
  final int menuId, menuPrice;

  MenuModel(
      {required this.menuId,
      required this.menuName,
      required this.menuPrice,
      required this.menuDescription});

  MenuModel.fromJson(Map<String, dynamic> json)
      : menuId = json['menuId'],
        menuName = json['menuName'],
        menuDescription = json['menuDescription'],
        menuPrice = json['menuPrice'];
}
