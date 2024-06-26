// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAIE_A7PXQSO3jTkqXbo69-NLM_42Otv_8',
    appId: '1:618354868044:web:965596c2cc7aed84b159e9',
    messagingSenderId: '618354868044',
    projectId: 'msmotors-3e44f',
    authDomain: 'msmotors-3e44f.firebaseapp.com',
    storageBucket: 'msmotors-3e44f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFWyM5bLoQJEzzcYmgg-bkOZmm1TvmXWc',
    appId: '1:618354868044:android:4630fc911a6a3a99b159e9',
    messagingSenderId: '618354868044',
    projectId: 'msmotors-3e44f',
    storageBucket: 'msmotors-3e44f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCF1nVvo9j8TNDe2SM5xl4YxA0f0sRJjo',
    appId: '1:618354868044:ios:ca2445ff14f9d273b159e9',
    messagingSenderId: '618354868044',
    projectId: 'msmotors-3e44f',
    storageBucket: 'msmotors-3e44f.appspot.com',
    iosBundleId: 'com.example.msMotorsAppFlutter',
  );
}
