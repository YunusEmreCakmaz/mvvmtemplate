import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../base/model/base_model.dart';
import '../../base/model/error.dart';
import '../../constants/enums/http_type_enum.dart';
import '../../extension/network_type_extension.dart';
import 'icore_dio.dart';
import 'iresponse_model.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      String urlSuffix = '',
      Map<String, dynamic> queryParameters,
      void Function(int, int) onReceiveProgress}) async {
    final response = await request(
      '$path$urlSuffix',
      data: data,
      options: Options(method: type.rawValue),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError('message'));
    }
  }
}
