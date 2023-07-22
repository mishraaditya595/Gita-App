
import 'dart:ui';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sbg/injection.dart';
import 'package:sbg/services/db/database_service.dart';
import 'package:sbg/services/notifications/firebase/firebase_messaging_service.dart';
import 'package:sbg/ui/bookhome/provider/home_page_provider.dart';
import 'package:sbg/ui/bookmark/provider/bookmark_provider.dart';
import 'package:sbg/ui/chapter/provider/chapter_screen_provider.dart';
import 'package:sbg/ui/loading/screen/loading_screen.dart';
import 'package:sbg/ui/verse/provider/verse_screen_provider.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/hexcolor.dart';
import 'package:sbg/utils/routers.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if(!kIsWeb && !kDebugMode) {
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((BuildContext context) => HomePageProvider()),
        ),
        ChangeNotifierProvider(
          create: ((BuildContext context) => ChapterScreenProvider()),
        ),
        ChangeNotifierProvider(
          create: ((BuildContext context) => VerseScreenProvider()),
        ),
        ChangeNotifierProvider(
          create: ((BuildContext context) => BookmarkProvider()),
        ),
      ],
      child: MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: HexColor(ColourConstants.backgroundWhite),
      cardColor: HexColor(ColourConstants.backgroundWhite)
        ),
        onGenerateRoute: (RouteSettings settings) => generateRoute(settings),
        home: const Padding(
      padding: EdgeInsets.all(8.0),
      child:  LoadingScreen()
        ),
      ),
    );
  }


  Future<void> getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
  }
}


