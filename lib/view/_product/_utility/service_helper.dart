import 'package:flutter/material.dart';

import '../../../core/init/network/iresponse_model.dart';

abstract class ServiceHelper {
  void showMessage(
      GlobalKey<ScaffoldState> scaffoldKey, IErrorModel errorModel) {
    if (scaffoldKey == null || errorModel == null) return;
    scaffoldKey.currentState.showSnackBar(SnackBar(
        content:
            Text(errorModel.description ?? errorModel.statusCode.toString())));
  }
}
