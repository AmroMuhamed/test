import 'dart:convert';

import 'package:hrapp/Utils/constant.dart';
import 'package:hrapp/Utils/logger.dart';
import 'package:hrapp/Utils/shared_pref_helper.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static DioHelper _instance = DioHelper.internal();
  static Dio? _dio;
  static int _connectionTimeOut = 5000000;

  DioHelper.internal();

  factory DioHelper() {
    return _instance;
  }

  Dio getDio() {
     if (_dio == null) {
      _dio = Dio();
      _dio!.options = _defaultBaseOption;
      _dio!.interceptors.add(_interceptorsWrapper);
    }
    return _dio!;
  }

  Dio getDioWithoutToken() {
    _dio = Dio();
    _dio!.options = _defaultBaseOption;
    _dio!.interceptors.add(_interceptorsWrapper);
    return _dio!;
  }

  BaseOptions get _defaultBaseOption => BaseOptions(
    connectTimeout: Duration(seconds: 30), // 60 seconds
    receiveTimeout: Duration(seconds: 30) ,
      baseUrl: Constant.appLive ? Constant.baseLiveUrl : Constant.baseDebugUrl,
       );

  void updateBearerToken({String? token}) {
    if (token == null) {
      _dio!.options.headers["Authorization"] =
          'Bearer ${SharedPRefHelper().getBearerToken}';
    } else
      _dio!.options.headers[''] = 'Authorization $token';
  }

  InterceptorsWrapper get _interceptorsWrapper => InterceptorsWrapper(

    onError: (e, handler) async {
      print(e.response);
      if (e.response?.statusCode == 400) {
        print(e.error);

        print(e.response!.data);
        return handler.reject(DioError(
            requestOptions: RequestOptions(path: ''),
            error: e.response!.data));
      } else {
        Logger.log(
            message: e.message!,
            name: 'error response:',
            stackTrace: e.stackTrace,
            error: e.error);
        return handler.next(e);
      }
    },
    onRequest: (options, handler) {
      return handler.next(options);
    },
    onResponse: (response, handler) {
      Logger.log(
          message: 'RESPONSE: ${json.encode(response.data)}',
          name: response.statusMessage!);

      return handler.next(response);
    },
  );
}
