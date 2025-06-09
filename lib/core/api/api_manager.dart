import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_constants.dart';

@singleton
class ApiManager {
  // static late Dio dio ;
  //
  // ApiManager(){
  //   dio  = Dio();
  // }

  Dio dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
    Object? data,
  }) {
    return dio.post(
      ApiConstants.baseUrl + endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
    Object? data,
  }) {
    return dio.delete(
      ApiConstants.baseUrl + endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }
}
