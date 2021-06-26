import 'package:flutter/material.dart';

import '../../../view/authentication/test/view/test_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestView());
        break;
      default:
        return MaterialPageRoute(builder: (context) {
          return NotFoundNavigationWidget();
        });
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
