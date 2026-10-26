import 'package:core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:prj2/firebase_options.dart';
import 'package:prj2/widget/ETH/eth_screen.dart';

final appNavigatorKey = GlobalKey<NavigatorState>();

Future<void> initializeAppServices() async {
  Map<String, dynamic>? pendingNotificationData;

  void handleNotificationTap(Map<String, dynamic> data) {
    if (data['screen'] != 'eth') return;

    final navigator = appNavigatorKey.currentState;
    if (navigator == null) {
      pendingNotificationData = data;
      return;
    }

    navigator.push(
      MaterialPageRoute<void>(
        builder: (_) => const EthScreen(),
      ),
    );
  }

  void openPendingNotification() {
    final data = pendingNotificationData;
    pendingNotificationData = null;

    if (data != null) {
      handleNotificationTap(data);
    }
  }
  await CoreServices.init(
    CoreConfig(
      firebaseOptions: DefaultFirebaseOptions.currentPlatform,
      debugMode: kDebugMode,
      remoteConfigDefaults: const {
        'welcome_message': 'Hello',
        'show_banner': true,
        'promo_notification_enabled': true,
      },
    ),
    handler: NotificationHandler(
      onTap: (data) {
        debugPrint('Notification data: $data');
        debugPrint('screen: ${data['screen']}');
        if (data['screen'] == null) {
          appNavigatorKey.currentState?.push(
            MaterialPageRoute<void>(
              builder: (_) => const EthScreen(),
            ),
          );
        }
      },
      onDataMessage: (data) {
        if (data['action'] == 'refresh_config') {
          CoreServices.instance.remoteConfig.fetch();
          return true;
        }
        return false;
      },
      shouldShow: (message) {
        if (message.data['type'] == 'promo') {
          return CoreServices.instance.remoteConfig
              .getBool('promo_notification_enabled');
        }
        return true;
      },
    ),
  );

  await CoreServices.instance.remoteConfig.fetch();
}
