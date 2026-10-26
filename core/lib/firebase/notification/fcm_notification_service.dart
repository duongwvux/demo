import 'package:core/firebase/config/core_config.dart';
import 'package:core/firebase/notification/notification_handler.dart';
import 'package:core/firebase/notification/notification_service.dart';
import 'package:core/firebase/storage/local_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FcmNotificationService implements NotificationService {
  FcmNotificationService(this._config, this._storage, this._handler);

  final CoreConfig _config;
  final LocalStorage _storage;
  final NotificationHandler _handler;

  final _fcm = FirebaseMessaging.instance;
  final _local = FlutterLocalNotificationsPlugin();

  static const _kToken = 'core_fcm_token';
  static const _kEnabled = 'core_noti_enabled';

  @override
  String? get token => _storage.getString(_kToken);

  @override
  bool get enabled => _storage.getBool(_kEnabled) ?? true;

  @override
  Future<void> setEnabled(bool value) =>  _storage.setBool(_kEnabled, value);

  @override
  Stream<String> get onTokenRefresh => _fcm.onTokenRefresh;

  @override
  Future<void> init() async {
    final settings = await _fcm.requestPermission();
    final granted =
        settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;

    if (_storage.getBool(_kEnabled) == null) await setEnabled(granted);

    await _initLocal();

    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    final t = await _fcm.getToken();
    if (t != null) await _storage.setString(_kToken, t);
    _fcm.onTokenRefresh.listen((t) => _storage.setString(_kToken, t));

    FirebaseMessaging.onMessage.listen(_onForeground);
    FirebaseMessaging.onMessageOpenedApp
        .listen((m) => _handler.onTap?.call(m.data));

    final initial = await _fcm.getInitialMessage();
    if (initial != null) _handler.onTap?.call(initial.data);
  }

  Future<void> _initLocal() async {
    await _local.initialize(
      settings: InitializationSettings(
        android: AndroidInitializationSettings(_config.androidNotificationIcon),
        iOS: const DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (resp) {
        _handler.onTap?.call(const {});
      }
    );

    await _local
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(AndroidNotificationChannel(
          _config.androidChannelId,
          _config.androidChannelName,
          importance: Importance.high,
        ));

  }

  void _onForeground(RemoteMessage message) {
    if (_handler.onDataMessage?.call(message.data) == true) return;

    if (!enabled) return;

    if (_handler.shouldShow?.call(message) == false) return;

    _handler.onForegroundMessage?.call(message);

    final title = message.notification?.title ?? message.data['title'] ?? 'Thông báo';
    final body = message.notification?.body ?? message.data['body'] ?? '';

    _local.show(
      id: message.hashCode,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _config.androidChannelId,
          _config.androidChannelName,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(),
      )
    );
  }

  @override
  Future<void> subscribeTopic(String topic) => _fcm.subscribeToTopic(topic);
  
  @override
  Future<void> unsubscribeTopic(String topic) => _fcm.unsubscribeFromTopic(topic);
}
