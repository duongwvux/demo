import 'package:core/firebase/config/core_config.dart';
import 'package:core/firebase/notification/background_handler.dart';
import 'package:core/firebase/notification/fcm_notification_service.dart';
import 'package:core/firebase/notification/notification_handler.dart';
import 'package:core/firebase/notification/notification_service.dart';
import 'package:core/firebase/remote_config/firebase_remote_config_service.dart';
import 'package:core/firebase/remote_config/remote_config_service.dart';
import 'package:core/firebase/storage/local_storage.dart';
import 'package:core/firebase/storage/prefs_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CoreServices {
  CoreServices._({
    required this.storage,
    required this.remoteConfig,
    required this.notification,
  });

  final LocalStorage storage;
  final RemoteConfigService remoteConfig;
  final NotificationService notification;

  static CoreServices? _instance;

  static CoreServices get instance {
    final i = _instance;
    if (i == null) {
      throw StateError('CoreServices chưa init. Gọi CoreServices.init() trong main().');
    }
    return i;
  }

  static Future<CoreServices> init(
    CoreConfig config,{
    NotificationHandler handler = const NotificationHandler()
  }) async {
    if (_instance != null) return _instance!;

    await Firebase.initializeApp(
      options: config.firebaseOptions
    );
    coreFirebaseOptions = config.firebaseOptions;
    FirebaseMessaging.onBackgroundMessage(coreBackgroundHandler);

    final storage = await PrefsStorage.create();

    final rc = FirebaseRemoteConfigService(config, storage);
    await rc.init();

    final noti = FcmNotificationService(config, storage, handler);
    await noti.init();

    return _instance = CoreServices._(
        storage: storage,
        remoteConfig: rc,
        notification: noti
    );
  }
}