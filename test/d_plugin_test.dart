import 'package:d_plugin/d_plugin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('is email operation', () {
    const String a = 'dyr-altunakargmail.co';
    print(a.isEmail);
  });
}
