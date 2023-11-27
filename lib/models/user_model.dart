class UserModel {
  final int userId;
  final String userName, token;

  UserModel(
      {required this.userId, required this.userName, required this.token});

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        userName = json['userName'],
        token = 'Bearer ${json['Authoriazation']}';
}
