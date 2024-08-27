abstract class BaseApiService {
  Future<dynamic> baseApiServiceCall(
      {Uri? url, String? bodyMap, required APIMethodName apiMethodName});
}

enum APIMethodName {
  get,
  post,
  delete,
  patch,
  put,
}
