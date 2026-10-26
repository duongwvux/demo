import 'dart:async';

import 'package:core/firebase/config/core_config.dart';
import 'package:core/firebase/remote_config/remote_config_service.dart';
import 'package:core/firebase/storage/local_storage.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService implements RemoteConfigService {
  FirebaseRemoteConfigService(this._config, this._storage);

  final CoreConfig _config;
  final LocalStorage _storage;
  final _rc = FirebaseRemoteConfig.instance;
  final _updated = StreamController.broadcast();

  static const _cachePrefix = 'rc_cache_';

  @override
  Future<void> init() async {
    await _rc.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: _config.remoteConfigFetchTimeout,
      minimumFetchInterval:
        _config.debugMode ? Duration.zero : _config.remoteConfigFetchInterval,
    ));

    await _rc.setDefaults(_config.remoteConfigDefaults);
  }

  @override
  Future<bool> fetch() async {
    try {
      await _rc.fetchAndActivate();
      for (final key in _config.remoteConfigDefaults.keys) {
        await _storage.setString('$_cachePrefix$key', _rc.getString(key));
      }
      _updated.add(null);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  String getString(String key) => _rc.getString(key);
  @override
  bool getBool(String key) => _rc.getBool(key);
  @override
  int getInt(String key) => _rc.getInt(key);
  @override
  double getDouble(String key) => _rc.getDouble(key);

  @override
  Stream<void> get onUpdated => _updated.stream;
}
