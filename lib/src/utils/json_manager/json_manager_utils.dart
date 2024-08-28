import 'package:collection/collection.dart';
import 'package:d_plugin/src/utils/json_manager/json_manager.dart';

/// [props] öğelerinin hashCode değerini döndürür.
int mapPropsToHashCode(Iterable<Object?>? props) {
  return _finish(props == null ? 0 : props.fold(0, _combine));
}

const DeepCollectionEquality _equality = DeepCollectionEquality();

/// [list1] ve [list2]'nin eşit olup olmadığını belirler.
bool equals(List<Object?>? list1, List<Object?>? list2) {
  if (identical(list1, list2)) return true;
  if (list1 == null || list2 == null) return false;
  if (list1.length != list2.length) return false;

  for (var i = 0; i < list1.length; i++) {
    final unit1 = list1[i];
    final unit2 = list2[i];

    if (_isJsonObject(unit1) && _isJsonObject(unit2)) {
      if (unit1 != unit2) return false;
    } else if (unit1 is Iterable || unit1 is Map) {
      if (!_equality.equals(unit1, unit2)) return false;
    } else if (unit1?.runtimeType != unit2?.runtimeType) {
      return false;
    } else if (unit1 != unit2) {
      return false;
    }
  }
  return true;
}

/// [JsonObject] olup olmadığını kontrol eder.
bool _isJsonObject(Object? object) {
  return object is JsonObject;
}

/// Jenkins Hash Fonksiyonu
/// https://en.wikipedia.org/wiki/Jenkins_hash_function
int _combine(int hash, Object? object) {
  if (object is Map) {
    object.keys.sorted((Object? a, Object? b) => a.hashCode - b.hashCode).forEach((Object? key) {
      hash = hash ^ _combine(hash, [key, (object! as Map)[key]]);
    });
    return hash;
  }

  if (object is Set) {
    object = object.sorted((Object? a, Object? b) => a.hashCode - b.hashCode);
  }

  if (object is Iterable) {
    for (final value in object) {
      hash = hash ^ _combine(hash, value);
    }
    return hash ^ object.length;
  }

  hash = 0x1fffffff & (hash + object.hashCode);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
  return hash ^ (hash >> 6);
}

/// Jenkins hash hesaplamasını bitirir.
int _finish(int hash) {
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);
  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}

/// [props] öğelerini string'e çevirir.
String mapPropsToString(Type runtimeType, List<Object?> props) {
  return '$runtimeType(${props.map((prop) => prop.toString()).join(', ')})';
}
