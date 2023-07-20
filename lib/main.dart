
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:sbg/injection.dart';
import 'package:sbg/services/db/database_service.dart';
import 'package:sbg/services/notifications/firebase/firebase_messaging_service.dart';
import 'package:sbg/ui/loading/screen/loading_screen.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/hexcolor.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform
  // const FirebaseOptions(
  //     apiKey: "AIzaSyAlz8SD1s6bXTaaDnHFCHqYY-8Gzx5NkD0",
  //     authDomain: "gita-237e4.firebaseapp.com",
  //     projectId: "gita-237e4",
  //     storageBucket: "gita-237e4.appspot.com",
  //     messagingSenderId: "1081572789234",
  //     appId: "1:1081572789234:web:21a237c2ba32f2b378796b",
  //     measurementId: "G-0L2PC6FDZN"
  // )
  );

  if(!kIsWeb) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  await FirebaseMessaging.instance.getInitialMessage();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int splashScreenLoaderTime = 10;

  @override
  void initState() {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    databaseService.init();

    if(!kIsWeb) {
      FirebaseMessagingService firebaseMessagingService =
      GetIt.instance.get<FirebaseMessagingService>();
      firebaseMessagingService.initializeLocalNotifications();
      firebaseMessagingService.listenToMessages();

      getFcmToken();
    }

    super.initState();
  }


  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Phoenix(
        child: MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: HexColor(ColourConstants.backgroundWhite),
        cardColor: HexColor(ColourConstants.backgroundWhite)
      ),
      home: const Padding(
        padding: EdgeInsets.all(8.0),
        child:  LoadingScreen()
      ),
    ));
  }


  Future<void> getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
  }
}


