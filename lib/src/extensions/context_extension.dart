import 'package:d_plugin/d_plugin.dart';
import 'package:flutter/widgets.dart';

/// The code snippet is defining an extension called `NavigatorManager` on the `BuildContext` class in
/// Flutter. This extension adds several methods that simplify navigation operations within a Flutter
/// app.
extension NavigatorMansager on BuildContext {
  NavigatorManager get navigation => NavigatorManager.of(this);
}
