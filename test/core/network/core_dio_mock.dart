import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvmtemplate/core/extension/network_type_extension.dart';
import 'package:mvvmtemplate/core/base/model/base_model.dart';
import 'package:mvvmtemplate/core/base/model/error.dart';
import 'package:mvvmtemplate/core/constants/enums/http_type_enum.dart';
import 'package:mvvmtemplate/core/init/network/icore_dio.dart';
import 'package:mvvmtemplate/core/init/network/iresponse_model.dart';

class CoreDioMock with DioMixin implements ICoreDioFull, Dio {
  final BaseOptions options;

  CoreDioMock(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());
    this.httpClientAdapter = DefaultHttpClientAdapter();
  }
  @override
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {HttpTypes type,
      T parseModel,
      data,
      Map<String, Object> queryParameters,
      void Function(int p1, int p2) onReceiveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("message"));
    }
  }

  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(String path,
      {HttpTypes type,
      T parseModel,
      data,
      Map<String, Object> queryParameters,
      void Function(int p1, int p2) onReceiveProgress}) async {
    String dumyJson = """[
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit suscipit recusandae consequuntur expedita et cumnreprehenderit molestiae ut ut quas totamnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body": "est rerum tempore vitaensequi sint nihil reprehenderit dolor beatae ea dolores nequenfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendisnqui aperiam non debitis possimus qui neque nisi nulla"
  }]""";
    final response = jsonDecode(dumyJson);
    final model = _responseParser<R, T>(parseModel, response);
    return ResponseModel<R>(data: model);
  }

  R _responseParser<R, T>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data) as R;
    }
    return data as R;
  }
}

class Dio {}
