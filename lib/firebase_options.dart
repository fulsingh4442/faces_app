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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2-7cvtULc4YdpNQUZXIFbR1EinEY1t-k',


    appId: '1:374151873688:android:0ae705a4d4b601aae07ced',




    messagingSenderId: '374151873688',

    projectId: 'tibu-project',


    storageBucket: 'tibu-project.appspot.com',


  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfE2AIdZqySMwHL30tZe4KNDesC5KEhhk',
    appId: ' 1:374151873688:ios:f55e105e036f2afce07ced',


    messagingSenderId: '374151873688',

    projectId: 'tibu-project',


    storageBucket: 'tibu-project.appspot.com',


    iosClientId: '374151873688-01nvkn851k6r9v3pj5sn71qcq99r4sfs.apps.googleusercontent.com',

    iosBundleId: 'com.facesdemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfE2AIdZqySMwHL30tZe4KNDesC5KEhhk',
    appId: '1:374151873688:ios:f55e105e036f2afce07ced',
    messagingSenderId: '374151873688',

    projectId: 'tibu-project',


    storageBucket: 'tibu-project.appspot.com',


    iosClientId: '374151873688-gn66t8fbdeqt6pthgcnujjpt97r0tv44.apps.googleusercontent.com',

    iosBundleId: 'com.nightclub.clubApp.clubApp',
  );
}
