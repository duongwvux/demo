import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseOptions? coreFirebaseOptions;

@pragma('vm:entry-point')
Future<void> coreBackgroundHandler(RemoteMessage message) async {
  if (coreFirebaseOptions != null) {
    await Firebase.initializeApp(options: coreFirebaseOptions);
  } else {
    await Firebase.initializeApp();
  }
}