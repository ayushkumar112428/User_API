abstract class BaseApiServices {
  Future<dynamic> getApi(String url, bool manage);

  Future<dynamic> postApi(dynamic data, String url);
}
