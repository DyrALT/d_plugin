import 'package:flutter/widgets.dart';

/// The code snippet is defining an extension called `NavigatorManager` on the `BuildContext` class in
/// Flutter. This extension adds several methods that simplify navigation operations within a Flutter
/// app.
extension NavigatorMansager on BuildContext {
  /// The function calculates the height of a widget based on a given value.
  ///
  /// Args:
  ///   value (double): The value is a double that represents the multiplier for the height of the
  /// screen.
  double height(double value) => MediaQuery.of(this).size.height * value;

  /// The function calculates the width of a widget based on a given value and the device's screen
  /// width.
  ///
  /// Args:
  ///   value (double): The value is a double that represents a multiplier for the width of the current
  /// device's screen.
  double width(double value) => MediaQuery.of(this).size.width * value;
}
