import 'package:get/get.dart';
import 'package:userauthapi/data/response/status.dart';
import 'package:userauthapi/models/home/user_data_model.dart';
import 'package:userauthapi/repository/home_repository/hone_repository.dart';

class HomeControllerData extends GetxController {
  final _api = HomeRepositoryData();

  final rxRequestStatus = Status.LOADING.obs;
  var userData = UserDataModel();
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(UserDataModel value) => userData = value;
  void setError(String value) => error.value = value;

  void userListApi() async {
    //  setRxRequestStatus(Status.LOADING);
    // final response = await _api.userDataApi();
    // userData.value = response;
    // setRxRequestStatus(Status.COMPLETED);
    _api.userDataApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userDataApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
