import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorkey =
      GlobalKey<NavigatorState>();
  dynamic pushTo(String route, {dynamic arguments}) {
    return navigatorkey.currentState?.pushNamed(route, arguments: arguments);
  }

  static dynamic pushReplacementTo(String route, {dynamic arguments}) {
    return navigatorkey.currentState
        ?.pushReplacementNamed(route, arguments: arguments);
  }

  static dynamic pushAndRemoveUntilTo(String route, {dynamic arguments}) {
    return navigatorkey.currentState?.pushNamedAndRemoveUntil(
        route, (route) => false,
        arguments: arguments);
  }

  static dynamic goBack() {
    return navigatorkey.currentState?.pop();
  }
}
