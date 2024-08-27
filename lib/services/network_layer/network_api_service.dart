import 'package:flutter/cupertino.dart';
import 'package:sel_org/constants/const_values/const_values.dart';
import 'package:sel_org/services/network_layer/response_model.dart';
import 'package:sel_org/services/storage_services/storage_service_implementation.dart';
import 'package:sel_org/ui_1/login/entity/login_models.dart';

import '../../environments/api_environments.dart';
import 'api_service.dart';
import 'base_api_service.dart';

class NetworkCalls {
  static Future getOtp({required Map<String, dynamic> body}) async {
    return await NetworkApiService()
        .baseApiServiceCall(
            apiMethodName: APIMethodName.post,
            url: APIEnvironments.getOtp,
            bodyMap: body)
        .then((response) async {
      debugPrint("response get otp : ${response.data}");
      return response.data;
    });
  }

  static Future verifyOtp({required Map<String, dynamic> body}) async {
    return await NetworkApiService()
        .baseApiServiceCall(
            apiMethodName: APIMethodName.post,
            url: APIEnvironments.verifyOtp,
            bodyMap: body)
        .then((response) async {
      return response;
    });
  }

  static Future<ResponseModel> dashboardCall() async {
    return await NetworkApiService()
        .baseApiServiceCall(
            apiMethodName: APIMethodName.get,
            url: APIEnvironments.dashboard(orgID: AppConstantValues().orgId))
        .then((response) async => ResponseModel.fromJson(
            Map<String, dynamic>.from(response.data)["message"]));
  }

  static Future getSubCategories(String categoryCode) async {
    return await NetworkApiService()
        .baseApiServiceCall(
          apiMethodName: APIMethodName.get,
          url: APIEnvironments.getsubCategories(
              categoryCode, AppConstantValues().orgId),
        )
        .then((response) async => response.data);
  }

  static Future getProfile() async {
    return await NetworkApiService()
        .baseApiServiceCall(
            apiMethodName: APIMethodName.get,
            url: APIEnvironments.profile(
              customerId: await StorageServiceImpl()
                  .getValue(key: AppConstantValues().customerId),
            ))
        .then((response) async {
      debugPrint("Get Profile Success...");
      return response;
    });
  }

  static Future updateProfile({required Map<String, dynamic> body}) async {
    return await NetworkApiService()
        .baseApiServiceCall(
      apiMethodName: APIMethodName.post,
      url: APIEnvironments.profileUpdate(),
      bodyMap: body,
    )
        .then((response) async {
      debugPrint("Update Profile Success...");
      return response;
    });
  }

  static Future getCartValues() async {
    return await NetworkApiService()
        .baseApiServiceCall(
            apiMethodName: APIMethodName.get,
            url: APIEnvironments.getCart(
                customerId: AppConstantValues().customerId))
        .then((response) async {
      return response;
    });
  }
}
