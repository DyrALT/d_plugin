import 'package:flutter/material.dart';

/// Extension to easily wrap any object in a ValueNotifier.
extension ValueNotifierExtension<T extends Object> on T {
  /// Converts the object into a [ValueNotifier] for reactive updates.
  ValueNotifier<T> get valueNotifier => ValueNotifier<T>(this);
}

/// Extension to simplify using ValueListenableBuilder with a ValueNotifier.
extension ValueNotifierBuilderExtension<T extends Object> on ValueNotifier<T> {
  /// Builds a widget that listens to this [ValueNotifier] and rebuilds accordingly.
  ///
  /// [builder] is called whenever the value changes.
  /// [child] is an optional static widget that won't rebuild.
  ValueListenableBuilder<T> builder({
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
    Widget? child,
  }) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: builder,
      child: child,
    );
  }
}
