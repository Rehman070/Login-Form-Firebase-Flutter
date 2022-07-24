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
    apiKey: 'AIzaSyD0qNivAqsx92yT8h-qLew3ySfHsXTmI98',
    appId: '1:195719740006:web:8f7c46883abf779fa40ba7',
    messagingSenderId: '195719740006',
    projectId: 'login-form-23086',
    authDomain: 'login-form-23086.firebaseapp.com',
    storageBucket: 'login-form-23086.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2J2h5JOOe6pUDAB0uWCdbwFegkLeEUdc',
    appId: '1:195719740006:android:d59b6e3e6eee0147a40ba7',
    messagingSenderId: '195719740006',
    projectId: 'login-form-23086',
    storageBucket: 'login-form-23086.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyW48b5aynPmwzRZRnchP6maBXANjIv64',
    appId: '1:195719740006:ios:9da6fa27fc6f29fba40ba7',
    messagingSenderId: '195719740006',
    projectId: 'login-form-23086',
    storageBucket: 'login-form-23086.appspot.com',
    iosClientId: '195719740006-r1irioekui65g9s35f817ad29n93f6o8.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginFormComplete',
  );
}