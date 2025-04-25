import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyASsSSqjxP6IZntpPK5o_YO2z6s-t60-FA',
    appId: '1:113896896541:web:490c91883e06dac1d5aef4',
    messagingSenderId: '113896896541',
    projectId: 'rally-fotografico-ccb4e',
    authDomain: 'rally-fotografico-ccb4e.firebaseapp.com',
    storageBucket: 'rally-fotografico-ccb4e.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3piGl2VqqA2rwlaHXMTdDIJvDr31ZYWY',
    appId: '1:113896896541:android:8ea3391c568d864cd5aef4',
    messagingSenderId: '113896896541',
    projectId: 'rally-fotografico-ccb4e',
    storageBucket: 'rally-fotografico-ccb4e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6m0lXgKaDNPfMffBuaH-9UMZXZcDqXjQ',
    appId: '1:113896896541:ios:541701053d5b6e0ad5aef4',
    messagingSenderId: '113896896541',
    projectId: 'rally-fotografico-ccb4e',
    storageBucket: 'rally-fotografico-ccb4e.firebasestorage.app',
    iosBundleId: 'com.example.rallyFotografico',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6m0lXgKaDNPfMffBuaH-9UMZXZcDqXjQ',
    appId: '1:113896896541:ios:541701053d5b6e0ad5aef4',
    messagingSenderId: '113896896541',
    projectId: 'rally-fotografico-ccb4e',
    storageBucket: 'rally-fotografico-ccb4e.firebasestorage.app',
    iosBundleId: 'com.example.rallyFotografico',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyASsSSqjxP6IZntpPK5o_YO2z6s-t60-FA',
    appId: '1:113896896541:web:0ce29825ebcc09ded5aef4',
    messagingSenderId: '113896896541',
    projectId: 'rally-fotografico-ccb4e',
    authDomain: 'rally-fotografico-ccb4e.firebaseapp.com',
    storageBucket: 'rally-fotografico-ccb4e.firebasestorage.app',
  );
}
