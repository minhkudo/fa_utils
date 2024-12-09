import 'dart:convert';

import 'package:fa_utils/generic/generic_function.dart';

extension DefaultMap<K, V> on Map<K, V> {
  V getOrElse(K key, V defaultValue) {
    if (containsKey(key)) {
      return this[key] ?? defaultValue;
    } else {
      return defaultValue;
    }
  }
}

extension StringMap<K, V> on Map<K, V> {
  String stringVal(K key, {String defaultValue = ''}) {
    if (this.containsKey(key)) {
      return castValue<String>(this[key]) ?? defaultValue;
    } else {
      return defaultValue;
    }
  }
}

extension IntMap<K, V> on Map<K, V> {
  intVal(K key, {int defaultValue = 0}) {
    if (this.containsKey(key)) {
      return int.parse(this[key] as String);
    } else {
      return defaultValue;
    }
  }
}

extension DoubleMap<K, V> on Map<K, V> {
  doubleVal(K key, {double? defaultValue}) {
    if (this.containsKey(key)) {
      return double.parse(this[key] as String);
    } else {
      return defaultValue;
    }
  }
}

extension BooleanMap<K, V> on Map<K, V> {
  bool boolVal(K key, {bool defaultValue = false}) {
    if (this.containsKey(key)) {
      if (this[key].toString().toLowerCase() == 'true') {
        return true;
      } else if (this[key].toString().toLowerCase() == 'false') {
        return false;
      }
      return defaultValue;
    } else {
      return defaultValue;
    }
  }
}

extension ObjectMap<T> on Map<String, dynamic> {
  T? objectVal(String key, Function(Map<String, dynamic>) fromJson, {T? defaultValue}) {
    if (containsKey(key)) {
      return fromJson(json.decode(this[key]));
    } else {
      return defaultValue;
    }
  }
}

