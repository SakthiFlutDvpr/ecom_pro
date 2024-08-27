class APIEnvironments {
  static const String baseUrl = "devapi.selorg.com";

  static final getOtp = Uri.https(baseUrl, '/v1/customer/generate-otp');
  static final verifyOtp = Uri.https(baseUrl, '/v1/customer/verify-otp');
  static final categoryList = Uri.https(baseUrl, '/v1/category/list');
  // static final dashboardGet = Uri.https(baseUrl, '/v1/dashboard/get');   /v1/home/search?q=orange&udf1=M07

  static Uri dashboard({required String orgID}) =>
      Uri.https(baseUrl, '/v1/dashboard/', {'orgid': orgID});

  // static dashboardGet({orgId}) =>
  //     Uri.parse(Uri.encodeFull('https://$baseUrl/v1/dashboard/?orgid=$orgId}'));
  static Uri getsubCategories(String categoryCode, String orgID) => Uri.https(
      baseUrl,
      '/v1/subCategory/list',
      {"categorycode": categoryCode, "orgid": orgID});

  static Uri profile({required String customerId}) => Uri.https(
      baseUrl, "/v1/customer/get-profile", {"customer_id": customerId});

  static Uri profileUpdate() =>
      Uri.https(baseUrl, '/v1/customer/update-profile');

  static getCart({customerId}) => Uri.parse(
      Uri.encodeFull('https://$baseUrl/v1/cart/?customer_id=$customerId}'));
}
