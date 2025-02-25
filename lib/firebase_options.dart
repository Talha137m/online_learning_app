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
        return macos;
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
    apiKey: 'AIzaSyANsQ9c81Rvc6vqnNz_mJZTe7b_rW1b5C4',
    appId: '1:314335484726:web:a0b415670e206ceda0b197',
    messagingSenderId: '314335484726',
    projectId: 'eacademy-7661f',
    authDomain: 'eacademy-7661f.firebaseapp.com',
    storageBucket: 'eacademy-7661f.appspot.com',
    measurementId: 'G-NW9RYHGY4G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0wsvxZbCErKLpRnVaU7BY9ZMV_W-aFE0',
    appId: '1:314335484726:android:488a2b987d99b61ca0b197',
    messagingSenderId: '314335484726',
    projectId: 'eacademy-7661f',
    storageBucket: 'eacademy-7661f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxpbYGJ8RIT200yUHPVPcBt27NYWnMjlk',
    appId: '1:314335484726:ios:f3a5986ad34510baa0b197',
    messagingSenderId: '314335484726',
    projectId: 'eacademy-7661f',
    storageBucket: 'eacademy-7661f.appspot.com',
    iosBundleId: 'com.example.talalProj',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAxpbYGJ8RIT200yUHPVPcBt27NYWnMjlk',
    appId: '1:314335484726:ios:0b0b37f84b397370a0b197',
    messagingSenderId: '314335484726',
    projectId: 'eacademy-7661f',
    storageBucket: 'eacademy-7661f.appspot.com',
    iosBundleId: 'com.example.talalProj.RunnerTests',
  );
}
