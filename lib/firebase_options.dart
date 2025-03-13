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
    apiKey: 'AIzaSyD0JCPD3oxCnEWarDyKwPcAKaKOiMGPwDM',
    appId: '1:510264322044:web:582672671246abfe1f7479',
    messagingSenderId: '510264322044',
    projectId: 'my-vistor',
    authDomain: 'my-vistor.firebaseapp.com',
    storageBucket: 'my-vistor.firebasestorage.app',
    measurementId: 'G-5GXSKRM5BX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQuH4hO2DE6PcbQm6QRd28A3BLAFuGyfo',
    appId: '1:510264322044:android:0322eb9cfc312d2d1f7479',
    messagingSenderId: '510264322044',
    projectId: 'my-vistor',
    storageBucket: 'my-vistor.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZVg5bnredttvVUurP3-HGVISaGrpNGd8',
    appId: '1:510264322044:ios:d50cc37c994d918f1f7479',
    messagingSenderId: '510264322044',
    projectId: 'my-vistor',
    storageBucket: 'my-vistor.firebasestorage.app',
    iosClientId:
        '510264322044-bu1eipc5facbksajhe1c8pt5poh0u81p.apps.googleusercontent.com',
    iosBundleId: 'com.example.myVisitor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZVg5bnredttvVUurP3-HGVISaGrpNGd8',
    appId: '1:510264322044:ios:d50cc37c994d918f1f7479',
    messagingSenderId: '510264322044',
    projectId: 'my-vistor',
    storageBucket: 'my-vistor.firebasestorage.app',
    iosClientId:
        '510264322044-bu1eipc5facbksajhe1c8pt5poh0u81p.apps.googleusercontent.com',
    iosBundleId: 'com.example.myVisitor',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD0JCPD3oxCnEWarDyKwPcAKaKOiMGPwDM',
    appId: '1:510264322044:web:0faa302c48def2851f7479',
    messagingSenderId: '510264322044',
    projectId: 'my-vistor',
    authDomain: 'my-vistor.firebaseapp.com',
    storageBucket: 'my-vistor.firebasestorage.app',
    measurementId: 'G-WNWDZHMVY2',
  );
}
