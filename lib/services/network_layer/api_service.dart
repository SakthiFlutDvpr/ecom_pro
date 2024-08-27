import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:sel_org/environments/api_environments.dart';
import 'package:sel_org/services/network_layer/api_service_singleton.dart';

import 'api_exception.dart';
import 'base_api_service.dart';
import 'interceptor_client.dart';

class NetworkApiService extends BaseApiService {
  final Dio _dio;

  NetworkApiService()
      : _dio = DioInterceptor().dio
          ..options.headers = APIServiceSingleton.instance.headers {
    _dio.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: APIEnvironments.baseUrl))
            .interceptor);
  }
  // Initialize Dio with interceptor and headers; // Initialize Dio with interceptor

  @override
  Future baseApiServiceCall({
    Uri? url,
    dynamic bodyMap,
    String? baseUrl = APIEnvironments.baseUrl,
    required APIMethodName apiMethodName,
  }) async {
    debugPrint("url :$url");

    try {
      Response<dynamic> response;
      switch (apiMethodName) {
        case APIMethodName.get:
          response = await _dio.getUri(url!);
          break;
        case APIMethodName.post:
          debugPrint('Request body: $bodyMap');
          response = await _dio.postUri(url!, data: bodyMap);
          break;
        case APIMethodName.delete:
          response = await _dio.deleteUri(url!, data: bodyMap);
          break;
        case APIMethodName.patch:
          response = await _dio.patchUri(url!, data: bodyMap);
          break;
        case APIMethodName.put:
          response = await _dio.putUri(url!, data: bodyMap);
          break;
      }
      debugPrint("responseData ${response.data}");
      return response; // Return response data
    } catch (e) {
      if (e is DioError) {
        throw FetchDataException(e.message);
      } else if (e is SocketException) {
        throw FetchDataException("Socket Exception: ${e.toString()}");
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }
  }
}
