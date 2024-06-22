import 'package:shared_preferences/shared_preferences.dart';
import 'package:userauthapi/models/login/user_model.dart';

class UserPreference {
  // Local Database (shared_preferences) In Data Is Save.
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    sp.setBool('isLogin', responseModel.isLogin!);

    return true;
  }

  //Get A Data Frome To Local Data Base (shared_preferences)
  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');

    return UserModel(token: token, isLogin: isLogin);
  }

  // Clear all data frome local database (shared_preferences)
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
