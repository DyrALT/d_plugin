import 'dart:convert';

import 'package:d_plugin/d_plugin.dart';
import 'package:d_plugin/src/extensions/value_notifier_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('is email operation', () {
    const String a = 'dyr.altunakargmail.co';
    print(a.isEmail);
  });

  test('json operation', () {
    final x = responseParser<User, User>(
      json.decode('{"name":"Dyr3"}'),
      model: User(),
    );
    final y = responseParser<User, User>(
      json.decode('{"name":"Dyr3"}'),
      model: User(),
    );

    print(x);
  });

  test('Value Notifier', () {
    final name = ''.valueNotifier;
    final name2 = 2.valueNotifier;
    final user = User(name: 'Dyr').valueNotifier;
  });
}

class User extends JsonObject {
  User({this.name});
  final String? name;

  @override
  User? fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
    );
  }

  @override
  bool? get printProps => true;

  @override
  List<Object?> get props => [name];
}
