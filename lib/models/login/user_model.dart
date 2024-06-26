// ignore_for_file: prefer_collection_literals

class UserModel {
  String? token;
  bool? isLogin;

  UserModel({this.token, this.isLogin});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    data['isLogin'] = token;
    return data;
  }
}
