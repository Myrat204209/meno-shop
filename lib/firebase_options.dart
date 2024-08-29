// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAYil3bNrJtQAgJPujAbWssKILEkSHzYYk',
    appId: '1:1046845564992:web:8daa0e84cd5028cb0fd7a5',
    messagingSenderId: '1046845564992',
    projectId: 'almaly-backend',
    authDomain: 'almaly-backend.firebaseapp.com',
    storageBucket: 'almaly-backend.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDT_aHr1vGcmfFpL1oTP3GaTeruBVo8hZU',
    appId: '1:1046845564992:android:c38c9dcdb9a408f90fd7a5',
    messagingSenderId: '1046845564992',
    projectId: 'almaly-backend',
    storageBucket: 'almaly-backend.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTTKEjOhoB-YcRD7Zx76GcOD2XpqYtUSI',
    appId: '1:1046845564992:ios:7a4cafcc312d58a20fd7a5',
    messagingSenderId: '1046845564992',
    projectId: 'almaly-backend',
    storageBucket: 'almaly-backend.appspot.com',
    iosBundleId: 'com.example.menoShop',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAYil3bNrJtQAgJPujAbWssKILEkSHzYYk',
    appId: '1:1046845564992:web:267bb2a616af00e30fd7a5',
    messagingSenderId: '1046845564992',
    projectId: 'almaly-backend',
    authDomain: 'almaly-backend.firebaseapp.com',
    storageBucket: 'almaly-backend.appspot.com',
  );
}