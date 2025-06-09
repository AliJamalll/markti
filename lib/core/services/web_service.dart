// ignore_for_file: deprecated_member_use, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '/core/services/cash_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

class WebServices {

  static WebServices? _this;

  factory WebServices() {

    _this ??= WebServices._();
    return _this!;

  }

  WebServices._() {

    freeDio.options.baseUrl = Constants.baseURL;
    tokenDio.options.baseUrl = Constants.baseURL;

    initializeInterceptors();
  }

  Dio freeDio = Dio();
  Dio tokenDio = Dio();

  String lang = "en";
  String? nonce;
  String? myToken;
  final String storageKeyMobileToken = "Authorization";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Check first time
  Future<bool> checkFirstTime() async {
    return await CashHelper.getBoolean("isFirstTime") ?? true;
  }

  /// set first time
  Future<bool> setFirstTime() async {
    return await CashHelper.setBoolean("isFirstTime", false);
  }

  /// Initialize language
  void initializeLanguage() async {
    lang = await CashHelper.getString("lang") ?? "EN";
  }

  /// function to change app language,
  void changeLanguage(String language) async {
    lang = language;

    await CashHelper.setString("lang", language);
  }

  /// Get current language,
  Future<String> getCurrentLang() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('lang') ?? lang;
  }

  /// Method that saves the token in Shared Preferences

  /* Future<bool> setMobileToken(String? token) async {
    mytoken = token;
    final SharedPreferences prefs = await _prefs;
    if (token == null) {
      prefs.remove(storageKeyMobileToken);
      return Future<bool>.value(false);
    } else {
      return prefs.setString(storageKeyMobileToken, token);
    }
  }*/

  /// Method that saves the token in Shared Preferences

  Future<bool> setMobileToken(String? token) async {
    myToken = token;
    final SharedPreferences prefs = await _prefs;
    if (token == null) {
      prefs.remove(storageKeyMobileToken);
      return Future<bool>.value(false);
    } else {
      return prefs.setString(storageKeyMobileToken, token);
    }
  }

  Future<String?> getMobileToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(storageKeyMobileToken);
  }

  /// initialize tokens

  Future<void> initializeToken() async {
    myToken = await getMobileToken();
    return;
  }

  initializeInterceptors() {
    // Clearing Interceptors
    freeDio.interceptors.clear();
    tokenDio.interceptors.clear();

    // freeDio Interceptors
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint(
              'send request：baseURL:${options.baseUrl} path:${options.path}，');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse: (response, handler) {
          debugPrint("status code: ${response.statusCode}");
          debugPrint("data: ${response.data}");

          // Do something with response data
          log(response.data.toString());
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint("error ${e.error}");
          debugPrint("message ${e.message}");
          debugPrint("type ${e.type}");

          /// Todo Handling EasyLoading
          EasyLoading.dismiss();

          return handler.next(e);
        },
      ),
    );

    tokenDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // EasyLoading.show();
          // Do something before request is sent

          options.headers["Authorization"] = "Bearer $myToken";
          // options.queryParameters = {
          //   "lang": navigatorKey.currentContext!.locale,
          //   "Nonce": nonce,
          // };

          debugPrint(
              'send request path:${options.path}，baseURL:${options.baseUrl}');
          debugPrint("method: ${options.method}");
          debugPrint('headers: ${options.headers}');
          debugPrint('data: ${options.data}');
          debugPrint('query parameters: ${options.queryParameters}');

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse: (response, handler) {
          debugPrint('status code: ${response.statusCode}');
          debugPrint('data: ${response.data}');
          // Do something with response data

          log(response.data.toString());

          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          EasyLoading.dismiss();

          if (e.response != null) {
            if (e.response!.statusCode == 401 ||
                e.response!.statusCode == 403) {
              CashHelper.removeKey(storageKeyMobileToken);
            } else {
              return handler.next(e);
            }
          } else {
            return handler.next(e);
          }

          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint("error ${e.error}");
          debugPrint("message ${e.message}");
          debugPrint("type ${e.type}");

          return handler.next(e);
        },
      ),
    );
  }
}
