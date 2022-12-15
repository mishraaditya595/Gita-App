import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sbg/network/chapter_summary_loader.dart';
import 'package:sbg/ui/screens/about_page.dart';
import 'package:sbg/ui/screens/home_page.dart';
import 'package:sbg/ui/screens/saved_page.dart';
import 'package:sbg/utils/constants.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:http/http.dart' as http;

import 'objectbox.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
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
    checkForBackendChanges();
    setState(() {
      splashScreenLoaderTime = 10;
    });
    super.initState();
    log(shouldMakeApiCall);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: SplashScreen(
          seconds: splashScreenLoaderTime,
          navigateAfterSeconds: MyHomePage(title: '',),
          title: const Text('Welcome In SplashScreen'),
          image: Image.asset("assets/images/temp_radha_krishna.jpeg"),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: const TextStyle(),
          photoSize: 100.0,
          loadingText: const Text("Loading..."),
          loaderColor: Colors.orange
      ),
    );
  }

  Future<String> lookForBackendChanges() async {
    http.Response res = await http.get(
        Uri.parse('https://iraapaycdfoslqefnvef.supabase.co/rest/v1/tbl_change_data?select=new_change'),
        headers: {
          'Authorization': Constants.AUTHORIZATION,
          'apikey': Constants.API_KEY
        });

    var jsonResp = jsonDecode(res.body) as List;
    var response = jsonResp[0]['new_change'].toString();
    log("Backend Changes: $response");

    return response;
  }

  void checkForBackendChanges() async {
    var _lookForBackendChanges = await lookForBackendChanges();
    setState(() {
      shouldMakeApiCall = _lookForBackendChanges;
      log(shouldMakeApiCall);
    });
    if(shouldMakeApiCall == "true") {
      ChapterSummaryLoader().getDataFromDB();
    }
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
    const SavedPage(),
    const AboutPage()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: IconThemeData(color: Colors.orange, size: 30),
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.question_mark), label: "About")
        ],
      ),
    );
  }

}
