import 'dart:convert';

import 'package:flutter/foundation.dart';

extension MapExtension on Map<String, dynamic> {
  Future<String?> safeJsonEncodeCompute() async {
    try {
      final response = await compute<Object, String>(
        jsonEncode,
        this,
      );
      return response;
    } catch (e) {
      return null;
    }
  }
}
