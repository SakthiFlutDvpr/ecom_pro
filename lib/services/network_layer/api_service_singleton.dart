class APIServiceSingleton {
  APIServiceSingleton._internal();

  Map<String, String> headers = {
    'Content-type': 'application/x-www-form-urlencoded',
    'Accept': '*/*'
  };
  String? baseURl;

  static final APIServiceSingleton instance = APIServiceSingleton._internal();
}
