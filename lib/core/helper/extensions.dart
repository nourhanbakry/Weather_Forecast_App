import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName,
        arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUtin(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, predicate,
        arguments: arguments);
  }

  void pop() {
    Navigator.pop(this);
  }
}

extension ScreenUtils on BuildContext {
  double screenWidth() {
    return MediaQuery.of(this).size.width;
  }

  double screenHight() {
    return MediaQuery.of(this).size.height;
  }
}
