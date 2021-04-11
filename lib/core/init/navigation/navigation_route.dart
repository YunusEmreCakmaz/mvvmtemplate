import 'package:flutter/material.dart';
import 'package:mvvmtemplate/core/components/card/not_found_navigation_widget.dart';
import 'package:mvvmtemplate/core/constants/navigation/navigation_constants.dart';
import 'package:mvvmtemplate/view/authentication/test/view/test_view.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
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
