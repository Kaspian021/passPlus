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
    apiKey: 'AIzaSyBnnrMFgqWpQ-9RQXKytfiU4cS6Wf8huGY',
    appId: '1:447663981798:web:cd2a8186a2a2b109c2a727',
    messagingSenderId: '447663981798',
    projectId: 'passplus-e532b',
    authDomain: 'passplus-e532b.firebaseapp.com',
    storageBucket: 'passplus-e532b.firebasestorage.app',
    measurementId: 'G-SDWW28JKC2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLH0Hzm5pRAE7DYPDr0ci4dbWWalEbiEw',
    appId: '1:447663981798:android:979a676b0853efa2c2a727',
    messagingSenderId: '447663981798',
    projectId: 'passplus-e532b',
    storageBucket: 'passplus-e532b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTme9fW6POhFMPBBh2qyQdbTtBz5fQ7aM',
    appId: '1:447663981798:ios:08ff3594d1f518c2c2a727',
    messagingSenderId: '447663981798',
    projectId: 'passplus-e532b',
    storageBucket: 'passplus-e532b.firebasestorage.app',
    iosBundleId: 'com.example.passplus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTme9fW6POhFMPBBh2qyQdbTtBz5fQ7aM',
    appId: '1:447663981798:ios:08ff3594d1f518c2c2a727',
    messagingSenderId: '447663981798',
    projectId: 'passplus-e532b',
    storageBucket: 'passplus-e532b.firebasestorage.app',
    iosBundleId: 'com.example.passplus',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBnnrMFgqWpQ-9RQXKytfiU4cS6Wf8huGY',
    appId: '1:447663981798:web:038a2b869b4d7700c2a727',
    messagingSenderId: '447663981798',
    projectId: 'passplus-e532b',
    authDomain: 'passplus-e532b.firebaseapp.com',
    storageBucket: 'passplus-e532b.firebasestorage.app',
    measurementId: 'G-6XRY3LEQ0N',
  );

}