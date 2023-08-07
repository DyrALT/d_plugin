import 'package:flutter/material.dart';

final class NavigatorManager {
  NavigatorManager._();

  factory NavigatorManager.of(BuildContext context) {
    instance._context ??= context;
    return instance;
  }
  BuildContext? _context;

  static final instance = NavigatorManager._();

  NavigatorState get _navigation {
    if (_context == null) {
      throw Exception('NavigatorManager is not initialized');
    }
    return Navigator.of(_context!);
  }

  Future<T?> push<T extends Object?>(Widget page) {
    return _navigation.push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pop<T extends Object?>([T? result]) {
    _navigation.pop(result);
  }

  void popUntil(RoutePredicate predicate) {
    _navigation.popUntil(predicate);
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    return _navigation.pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      result: result,
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget page,
  ) {
    return _navigation.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }
}
