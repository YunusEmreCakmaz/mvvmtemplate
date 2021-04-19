import 'package:flutter/material.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_type_enum.dart';

import 'iresponse_model.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, dynamic> queryParameters,
      void Function(int, int) onReceiveProgress});
}
