import 'package:flutter/material.dart';

class AppNavigator {
  // Push
  static Future<dynamic> push(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  // Replace
  static Future<dynamic> pushReplacement(
      BuildContext context, Widget page) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  // Push Named
  static Future<dynamic> pushNamed(
      BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  // Replace Named
  static Future<dynamic> pushReplacementNamed(
      BuildContext context, String routeName) {
    return Navigator.pushReplacementNamed(context, routeName);
  }

  // Pop
  static void pop(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }
}