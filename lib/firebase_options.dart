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
        return macos;
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
    apiKey: 'AIzaSyACDsg6wHuhrioM4IEz8P3JNFGK868XjtA',
    appId: '1:64943268816:web:8b09bead791b0d2e9a4fd5',
    messagingSenderId: '64943268816',
    projectId: 'recipe-app-25f94',
    authDomain: 'recipe-app-25f94.firebaseapp.com',
    storageBucket: 'recipe-app-25f94.appspot.com',
    measurementId: 'G-V5LLC70EG9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOEkzAGQyOXUVOWo9K7KLDpx8VnA2NgXU',
    appId: '1:64943268816:android:61563c72b670ed959a4fd5',
    messagingSenderId: '64943268816',
    projectId: 'recipe-app-25f94',
    storageBucket: 'recipe-app-25f94.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQkOQgWTcSO5LUhYEfyYs-Ztk1VB38vAg',
    appId: '1:64943268816:ios:b2a23ed3eb0e93269a4fd5',
    messagingSenderId: '64943268816',
    projectId: 'recipe-app-25f94',
    storageBucket: 'recipe-app-25f94.appspot.com',
    iosBundleId: 'com.example.finalProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQkOQgWTcSO5LUhYEfyYs-Ztk1VB38vAg',
    appId: '1:64943268816:ios:b2a23ed3eb0e93269a4fd5',
    messagingSenderId: '64943268816',
    projectId: 'recipe-app-25f94',
    storageBucket: 'recipe-app-25f94.appspot.com',
    iosBundleId: 'com.example.finalProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyACDsg6wHuhrioM4IEz8P3JNFGK868XjtA',
    appId: '1:64943268816:web:97e6b6219177a1109a4fd5',
    messagingSenderId: '64943268816',
    projectId: 'recipe-app-25f94',
    authDomain: 'recipe-app-25f94.firebaseapp.com',
    storageBucket: 'recipe-app-25f94.appspot.com',
    measurementId: 'G-3D4PYVBGNV',
  );
}
