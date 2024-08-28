import 'dart:convert';
import 'dart:math';

import 'package:d_plugin/d_plugin.dart';
import 'package:d_plugin/src/utils/json_manager/json_manager.dart';
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
    
    
  });
}

class User extends JsonObject<User> {
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
