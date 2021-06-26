import 'package:dio/dio.dart';

import 'core_dio.dart';
import 'icore_dio.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'http://192.168.1.53:3000/', //'http://10.0.2.2:3000/',
      /*headers: {
        "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      },*/
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
