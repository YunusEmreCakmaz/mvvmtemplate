import 'package:flutter/cupertino.dart';
import 'package:mvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:mvvmtemplate/core/init/navigation/navigation_service.dart';

import '../../init/network/icore_dio.dart';
import '../../init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext context;
  ICoreDio coreDio = NetworkManager.instance.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
