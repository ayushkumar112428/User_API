import 'package:userauthapi/data/network/network_api_services.dart';
import 'package:userauthapi/models/home/user_data_model.dart';
import 'package:userauthapi/models/home/user_list_model.dart';
import 'package:userauthapi/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<List<UserListModel>> userListApi() async {
    List<UserListModel> response =
        await _apiService.getApi(AppUrl.userListApi, true);
    return response;
  }
}

class HomeRepositoryData {
  final _apiService = NetworkApiServices();

  Future<UserDataModel> userDataApi() async {
    UserDataModel response =
        await _apiService.getApi(AppUrl.usreDataApi, false);
    return response;
  }
}
