import 'package:d_plugin/src/utils/json_manager/json_manager_utils.dart';
import 'package:flutter/widgets.dart';

R? responseParser<I extends JsonObject, R>(
  dynamic response, {
  I? model,
}) {
  assert(model != null, 'model is null');

  if (response == null) {
    return null;
  }

  if (response is Map<String, dynamic>) {
    return model!.fromJson(response) as R;
  }

  if (response is List) {
    return response
        .map((e) => model?.fromJson(e is Map<String, dynamic> ? e : {}))
        .cast<I>()
        .toList() as R;
  }

  return null;
}

@immutable
abstract class JsonObject {
  List<Object?> get props;

  bool? get printProps => null;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is JsonObject && runtimeType == other.runtimeType && equals(props, other.props);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ mapPropsToHashCode(props);

  @override
  String toString() {
    if (printProps ?? false) {
      return mapPropsToString(runtimeType, props);
    }
    return '$runtimeType';
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  JsonObject? fromJson(Map<String, dynamic> json) {
    return null;
  }
}
