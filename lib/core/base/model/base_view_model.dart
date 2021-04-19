import 'package:flutter/cupertino.dart';
import 'package:mvvmtemplate/core/init/network/icore_dio.dart';
import 'package:mvvmtemplate/core/init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext context;
  ICoreDio coreDio = NetworkManager.instance.coreDio;
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
