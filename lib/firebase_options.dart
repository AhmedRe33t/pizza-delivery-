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
    apiKey: 'AIzaSyBqvThE0W2tfSmQ-22c2ilGIbZKBXZCQdM',
    appId: '1:1068662131377:web:19eb35bce845398157f090',
    messagingSenderId: '1068662131377',
    projectId: 'pizza-delivery-14d51',
    authDomain: 'pizza-delivery-14d51.firebaseapp.com',
    storageBucket: 'pizza-delivery-14d51.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAugayKjcXPRHW8K4aenWLye3YaJLfgoiM',
    appId: '1:1068662131377:android:573055eed0f57e1257f090',
    messagingSenderId: '1068662131377',
    projectId: 'pizza-delivery-14d51',
    storageBucket: 'pizza-delivery-14d51.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMrVipnT3TsKRDKrrYcA8JhASETgJtLrI',
    appId: '1:1068662131377:ios:daeb955ff853166057f090',
    messagingSenderId: '1068662131377',
    projectId: 'pizza-delivery-14d51',
    storageBucket: 'pizza-delivery-14d51.appspot.com',
    iosBundleId: 'com.example.pizza',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMrVipnT3TsKRDKrrYcA8JhASETgJtLrI',
    appId: '1:1068662131377:ios:daeb955ff853166057f090',
    messagingSenderId: '1068662131377',
    projectId: 'pizza-delivery-14d51',
    storageBucket: 'pizza-delivery-14d51.appspot.com',
    iosBundleId: 'com.example.pizza',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBqvThE0W2tfSmQ-22c2ilGIbZKBXZCQdM',
    appId: '1:1068662131377:web:3cf35211b78222df57f090',
    messagingSenderId: '1068662131377',
    projectId: 'pizza-delivery-14d51',
    authDomain: 'pizza-delivery-14d51.firebaseapp.com',
    storageBucket: 'pizza-delivery-14d51.appspot.com',
  );

}