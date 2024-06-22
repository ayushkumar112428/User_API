// ignore_for_file: prefer_interpolation_to_compose_strings
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:userauthapi/data/network/base_api_services.dart';
import 'package:userauthapi/data/user_data.dart';
import 'package:userauthapi/models/home/user_data_model.dart';
import 'package:userauthapi/models/home/user_list_model.dart';
import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url, bool manage) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (manage) {
        dynamic responseJson = returnResponseDynamicData(response);
        for (Map<String, dynamic> index in responseJson) {
          userListOfData.add(UserListModel.fromJson(index));
        }

        return userListOfData;
      } else {
        dynamic output = returnResponseDynamicData(response);
        userData = UserDataModel.fromJson(output);

        return userData;
      }
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    // if (kDebugMode) {
    //   print(url);
    //   print(data);
    // }

    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponseDynamicData(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    // if (kDebugMode) {
    //   print(responseJson);
    // }
    return responseJson;
  }

  dynamic returnResponseDynamicData(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            'Error accorded while communicating with server ' +
                response.statusCode.toString());
    }
  }

  // dynamic returnResponseListData(http.Response response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       dynamic responseJson = jsonDecode(response.body.toString());
  //       for (Map<String, dynamic> index in responseJson) {
  //         userListOfData.add(UserListModel.fromJson(index));
  //       }
  //       return userListOfData;
  //     case 400:
  //       dynamic responseJson = jsonDecode(response.body);
  //       return responseJson;
  //     default:
  //       throw FetchDataException(
  //           'Error accorded while communicating with server ' +
  //               response.statusCode.toString());
  //   }
  // }
}
