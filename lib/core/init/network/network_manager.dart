import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mvvmtemplate/core/base/model/base_model.dart';
import 'package:mvvmtemplate/core/base/model/error.dart';
import 'package:mvvmtemplate/core/constants/enums/preferences_keys_enum.dart';
import 'package:mvvmtemplate/core/init/cache/locale_manager.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        headers: {
          "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
        });
    _dio = Dio(baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return options.path += "emre";
      },
      onResponse: (response, handler) {
        return response.data;
      },
      onError: (DioError e, handler) {
        return BaseError(e.message);
      },
    ));
  }
  Dio _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody);
        } else
          return responseBody;
        break;
      default:
    }
  }
}
