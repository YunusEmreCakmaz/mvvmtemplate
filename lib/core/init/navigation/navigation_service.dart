import 'package:flutter/cupertino.dart';

import 'inavigation_service.dart';

class NavigationService implements INavigationService {
  static NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  Future<void> navigateToPage(String path, Object object) async {
    await navigatorKey.currentState.pushNamed(path, arguments: object);
  }

  @override
  Future<void> navigateToPageClear(String path, Object object) async {
    await navigatorKey.currentState
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: object);
  }
}
