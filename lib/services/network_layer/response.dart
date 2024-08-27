import 'package:dio/dio.dart';

dynamic returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return {
        'status': true,
        'statusCode': response.statusCode,
        'data': response.data
      };
    case 400:
      return {
        'status': false,
        'statusCode': response.statusCode,
        'data': response.data
      };
    case 401:
      return {
        'status': false,
        'statusCode': response.statusCode,
        'data': response.data
      };
    case 403:
      return {
        'status': false,
        'statusCode': response.statusCode,
        'data': response.data
      };
    case 404:
      return {
        'status': false,
        'statusCode': response.statusCode,
        'data': response.data
      };
    case 500:
      return {
        'status': false,
        'statusCode': response.statusCode,
        'data': response.data
      };
    default:
      return {
        'status': false,
        'statusCode': response.statusCode,
        'data': response.data
      };
  }
}
