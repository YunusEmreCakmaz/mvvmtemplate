import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mvvmtemplate/core/init/network/core_dio.dart';
import 'package:mvvmtemplate/core/init/network/icore_dio.dart';

import '../../base/model/base_model.dart';
import '../../base/model/error.dart';
import '../../constants/enums/preferences_keys_enum.dart';
import '../cache/locale_manager.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  ICoreDio coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      headers: {
        "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      },
    );

    //_dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);

    /*_dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options) {
        options.path += "veli";
      },
      // onResponse: (e) {
      //   return e.data;
      // },
      onError: (e) {
        return BaseError(e.message);
      },
    ));
  }*/
  }
}
