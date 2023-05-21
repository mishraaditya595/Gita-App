import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/network/chapter_detailed_loader.dart';
import 'package:sbg/network/chapter_summary_loader.dart';
import 'package:sbg/network/stories_loader.dart';
import 'package:sbg/services/notifications/firebase/firebase_notification_service.dart';
import 'package:sbg/services/notifications/local/notification_service.dart';
import 'package:sbg/ui/screens/about_page.dart';
import 'package:sbg/ui/screens/home_page.dart';
import 'package:sbg/ui/screens/bookmark_page.dart';
import 'package:sbg/ui/screens/login_screen.dart';
import 'package:sbg/ui/screens/more_screen.dart';
import 'package:sbg/utils/constants.dart';
import 'package:sbg/utils/global_variables.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:http/http.dart' as http;

import 'network/daily_darshan_loader.dart';
import 'objectbox.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
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
  String? notificationTitle;
  String? notificationBody;
  String? notificationData;
  bool? internetConnectivity;

  @override
  void initState() {
    checkInternetConnectivity();
    checkForBackendChanges();
    // setState(() {
    //   splashScreenLoaderTime = 4;
    // });

    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

    getFcmToken();

    super.initState();
    log(shouldMakeApiCall);
    launchNotificationsServices();
  }

  _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) {
    setState(() => notificationTitle = msg);
    if (notificationTitle != null) {
      log(notificationBody != null ? notificationBody! : "no body");
      NotificationService()
          .showNotifications(notificationTitle!, notificationBody);
    }
  }

  launchNotificationsServices() async {
    await NotificationService().init(context);
    NotificationService _notificationService = NotificationService();
    await _notificationService.scheduleNotifications();
  }

  checkInternetConnectivity() async {
    bool flag = await InternetConnectionChecker().hasConnection;
    debugPrint("Internet Available: $flag");
    setState(() {
      internetConnectivity = flag;
    });
    if (internetConnectivity!) {
      setState(() {
        splashScreenLoaderTime = 8;
      });
    } else {
      setState(() {
        splashScreenLoaderTime = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool flag = true;

    return Phoenix(
      child: MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SplashScreen(
              seconds: splashScreenLoaderTime,
              navigateAfterSeconds: flag
                  ? const MyHomePage(
                      title: '',
                    )
                  : const LoginScreen(),
              title: Text(
                'Srimad Bhagwad Gita',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              image: Image.asset("assets/images/gita.jpg"),
              backgroundColor: Colors.white,
              styleTextUnderTheLoader: const TextStyle(),
              photoSize: 100.0,
              loadingText: const Text("Loading data..."),
              loaderColor: Colors.deepOrangeAccent),
        ),
      ),
    );
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

    return response;
  }

  Future<MyHomePage> checkForBackendChanges() async {
    var _lookForBackendChanges = await lookForBackendChanges();
    setState(() {
      shouldMakeApiCall = _lookForBackendChanges;
    });

    GlobalVariables.store = await ObjectBox().getStore();

    if (shouldMakeApiCall == "true" && internetConnectivity!) {
      ChapterSummaryLoader().getDataFromDB();
      ChapterDetailedLoader().getDataFromDB();
      StoriesLoader().getDataFromDB();
      DailyDarshanLoader().getDataFromDB();
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
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: "Stories"),
        ],
      ),
    );
  }
}
