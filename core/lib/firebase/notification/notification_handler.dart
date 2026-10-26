import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationHandler {
  const NotificationHandler({
    this.onTap,
    this.onForegroundMessage,
    this.onDataMessage,
    this.shouldShow,
  });

  final void Function(Map<String, dynamic> data)? onTap;

  final void Function(RemoteMessage message)? onForegroundMessage;

  final bool Function(Map<String, dynamic> data)? onDataMessage;

  final bool Function(RemoteMessage message)? shouldShow;
}