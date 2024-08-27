import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioInterceptor {
  final Dio _dio;

  DioInterceptor() : _dio = Dio() {
    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        // Handle response
        int status = response.data['status'] ?? 0;

        debugPrint("status code $status");
        // Customize response handling based on status
        Response<dynamic> customResponse;
        switch (status) {
          case 200:
            customResponse = Response<dynamic>(
              requestOptions: response.requestOptions,
              data: {'message': response.data}, // Your custom response data
            );
            break;
          case 204:
            customResponse = Response<dynamic>(
              requestOptions: response.requestOptions,
              data: false, // Your custom response data
            );
            break;
          case 400:
            customResponse = Response<dynamic>(
              requestOptions: response.requestOptions,
              data: false, // Your custom response data
            );
            break;
          case 401:
            customResponse = Response<dynamic>(
              data: false, requestOptions: RequestOptions(path: ""), // Your custom response data
            );
            break;
          case 404:
            customResponse = Response<dynamic>(
              requestOptions: response.requestOptions,
              data: false, // Your custom response data
            );
            break;
          default:
            customResponse = Response<dynamic>(
              requestOptions: response.requestOptions,
              data: {'error': 'Unknown Error'}, // Your custom response data
              statusCode: status, // Preserve the original status code
            );
            break;
        }
        // Return manipulated response
        return handler.resolve(customResponse);
      },
      onError: (DioError e, handler) {
        // Handle error as needed
        debugPrint('Error: ${e.message}');
        return handler.reject(e);
      },
    ));
  }

  Dio get dio => _dio;
}
