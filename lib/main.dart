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
import 'package:sbg/ui/chapter_screen/provider/chapter_screen_provider.dart';
import 'package:sbg/ui/homepage/provider/home_page_provider.dart';
import 'package:sbg/ui/screens/about_page.dart';
import 'package:sbg/ui/homepage/screen/home_page.dart';
import 'package:sbg/ui/screens/bookmark_page.dart';
import 'package:sbg/ui/screens/more_screen.dart';
import 'package:sbg/utils/constants.dart';
import 'package:http/http.dart' as http;

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
  // This widget is the root of your application.

  int splashScreenLoaderTime = 10;
  String shouldMakeApiCall = "false";

  @override
  void initState() {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    databaseService.init();
    checkForBackendChanges();
    setState(() {
      splashScreenLoaderTime = 4;
    });

    FirebaseMessagingService firebaseMessagingService =
        GetIt.instance.get<FirebaseMessagingService>();
    firebaseMessagingService.initializeLocalNotifications();
    firebaseMessagingService.listenToMessages();

    getFcmToken();

    super.initState();
    log(shouldMakeApiCall);
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
        primarySwatch: Colors.orange,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSplashScreen(
          duration: splashScreenLoaderTime,
          splash: Image.asset("assets/images/gita.jpg"),
          backgroundColor: Colors.white,
          nextScreen: const MyHomePage(
            title: '',
          ),
        ),
      ),
    ));
  }

  Future<String> lookForBackendChanges() async {
    http.Response res = await http.get(
        Uri.parse(
            'https://iraapaycdfoslqefnvef.supabase.co/rest/v1/tbl_change_data?select=new_change'),
        headers: {
          'Authorization': Constants.SUPABASE_AUTHORIZATION,
          'apikey': Constants.SUPABASE_API_KEY
        });

    var jsonResp = jsonDecode(res.body) as List;
    var response = jsonResp[0]['new_change'].toString();
    log("Backend Changes: $response");

    setState(() {
      splashScreenLoaderTime = 1;
    });

    return response;
  }

  Future<MyHomePage> checkForBackendChanges() async {
    var _lookForBackendChanges = await lookForBackendChanges();
    setState(() {
      shouldMakeApiCall = _lookForBackendChanges;
      log(shouldMakeApiCall);
    });
    if (shouldMakeApiCall == "true") {
      ChapterSummaryLoader().getDataFromDB();
      ChapterDetailedLoader().getDataFromDB();
    }

    return const MyHomePage(title: '');
  }

  Future<void> getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const HomePage(),
    const BookmarkPage(),
    const AboutPage(),
    // const MoreScreen(),
  ];

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
      ],
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: const Text(
            "Srimad Bhagwad Gita",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: selectedIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.deepOrange),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          selectedIconTheme:
              const IconThemeData(color: Colors.deepOrange, size: 30),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "Bookmarks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_mark), label: "About"),
            // BottomNavigationBarItem(icon: Icon(Icons.more), label: "More"),
          ],
        ),
      ),
    );
  }
}
