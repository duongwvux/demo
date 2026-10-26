abstract class RemoteConfigService {
  Future<void> init();
  Future<bool> fetch();

  String getString(String key);
  bool getBool(String key);
  int getInt(String key);
  double getDouble(String key);

  Stream<void> get onUpdated;
}