import 'dart:async';

import 'package:get_storage/get_storage.dart';

/// Base class containing a unified API for key-value pairs' storage.
/// This class provides low level methods for storing:
/// - Sensitive keys using [FlutterSecureStorage]
class KeyValueStorageBase {
  /// Instance of shared preferences
  static GetStorage? _getStorage;

  /// Singleton instance of KeyValueStorage Helper
  static KeyValueStorageBase? _instance;

  static bool _didGetStorageInitialize = false;

  /// Get instance of this class
  factory KeyValueStorageBase() => _instance ?? const KeyValueStorageBase._();

  /// Private constructor
  const KeyValueStorageBase._();

  static const String _scrollPositionKey = 'scroll_position';

  /// Initializer for shared prefs and flutter secure storage
  /// Should be called in main before runApp and
  /// after WidgetsBinding.FlutterInitialized(), to allow for synchronous tasks
  /// when possible.
  static Future<void> init() async {
    _didGetStorageInitialize = await GetStorage.init();
    _getStorage ??= GetStorage();
  }

  /// Reads the value for the key from common preferences storage
  static T? getCommon<T>(String key) {
    T? res;
    if (_didGetStorageInitialize) {
      res = _getStorage!.read<T>(key);
    }
    return res;
  }

  /// Sets the value for the key to common preferences storage
  static Future<bool> setCommon<T>(String key, T value) async {
    if (_didGetStorageInitialize) {
      try {
        await _getStorage!.write(key, value);
        return true;
      } catch (err) {
        return false;
      }
    }
    return false;
  }

  static Future<bool> setScrollPosition(String key, double value) async {
    if (_didGetStorageInitialize) {
      return setCommon<double>('$_scrollPositionKey$key', value);
    }
    return false;
  }

  static double? getScrollPosition(String key) {
    if (_didGetStorageInitialize) {
      return getCommon<double>('$_scrollPositionKey$key');
    }
    return null;
  }

  static Future<bool> clearCommonKey(String key) async {
    if (_didGetStorageInitialize) {
      try {
        await _getStorage!.remove(key);
        return true;
      } catch (err) {
        return false;
      }
    }
    return false;
  }

  /// Erases common preferences keys
  static Future<bool> clearCommon() async {
    if (_didGetStorageInitialize) {
      try {
        await _getStorage!.erase();
        return true;
      } catch (err) {
        return false;
      }
    }
    return false;
  }
}
