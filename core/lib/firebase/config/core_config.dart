import 'package:firebase_core/firebase_core.dart';

class CoreConfig {
  const CoreConfig({
    required this.firebaseOptions,
    this.remoteConfigDefaults = const {},
    this.remoteConfigFetchInterval = const Duration(seconds: 30),
    this.remoteConfigFetchTimeout = const Duration(seconds: 10),
    this.androidChannelId = 'high_importance_channel',
    this.androidChannelName = 'Thông báo chung',
    this.androidNotificationIcon = '@mipmap/ic_launcher',
    this.debugMode = false,
  });

  final FirebaseOptions firebaseOptions;
  final Map<String, Object> remoteConfigDefaults;
  final Duration remoteConfigFetchInterval;
  final Duration remoteConfigFetchTimeout;
  final String androidChannelId;
  final String androidChannelName;
  final String androidNotificationIcon;
  final bool debugMode;
}