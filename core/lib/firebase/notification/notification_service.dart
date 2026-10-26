abstract class NotificationService {
  Future<void> init();
  String? get token;
  Stream<String> get onTokenRefresh;

  bool get enabled;
  Future<void> setEnabled(bool value);

  Future<void> subscribeTopic(String topic);
  Future<void> unsubscribeTopic(String topic);
}