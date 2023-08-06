import 'package:flutter/material.dart';

/// The code snippet is defining an extension called `NavigatorManager` on the `BuildContext` class in
/// Flutter. This extension adds several methods that simplify navigation operations within a Flutter
/// app.
extension NavigatorManager on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void popUntil(RoutePredicate predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      result: result,
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget page,
  ) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }
}
