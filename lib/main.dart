import 'dart:convert';
import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sbg/injection.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/network/chapter_detailed_loader.dart';
import 'package:sbg/network/chapter_summary_loader.dart';
import 'package:sbg/services/db/database_service.dart';
import 'package:sbg/services/notifications/firebase/firebase_messaging_service.dart';
import 'package:sbg/services/remote_config_service.dart';
import 'package:sbg/ui/bookmark/provider/bookmark_provider.dart';
import 'package:sbg/ui/chapter/provider/chapter_screen_provider.dart';
import 'package:sbg/ui/homepage/provider/home_page_provider.dart';
import 'package:sbg/ui/loading/screen/loading_screen.dart';
import 'package:sbg/ui/others/about_page.dart';
import 'package:sbg/ui/homepage/screen/home_page.dart';
import 'package:sbg/ui/bookmark/screen/bookmark_page.dart';
import 'package:sbg/ui/verse/provider/verse_screen_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'objectbox.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

    FirebaseMessagingService firebaseMessagingService =
        GetIt.instance.get<FirebaseMessagingService>();
    firebaseMessagingService.initializeLocalNotifications();
    firebaseMessagingService.listenToMessages();

    getFcmToken();

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
        // primarySwatch: Colors.orange,
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


