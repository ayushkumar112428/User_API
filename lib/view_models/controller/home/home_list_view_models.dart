import 'package:get/get.dart';
import 'package:userauthapi/data/response/status.dart';
import 'package:userauthapi/models/home/user_list_model.dart';
import 'package:userauthapi/repository/home_repository/hone_repository.dart';

class HomeControllerList extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = RxList<UserListModel>([]);
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(List<UserListModel> value) => userList.addAll(value);
  void setError(String value) => error.value = value;

  void userListApi() async {
    //  setRxRequestStatus(Status.LOADING);
    // final response = await _api.userListApi();
    // userList.value = response;
    // setRxRequestStatus(Status.COMPLETED);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      // print("Valu Type : ${value.runtimeType}");
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
