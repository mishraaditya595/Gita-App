import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bookmark/provider/bookmark_provider.dart';
import '../../bookmark/screen/bookmark_page.dart';
import '../../chapter/provider/chapter_screen_provider.dart';
import '../../homepage/provider/home_page_provider.dart';
import '../../homepage/screen/home_page.dart';
import '../../others/about_page.dart';
import '../../verse/provider/verse_screen_provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required this.title});

  final String title;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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
        ChangeNotifierProvider(
          create: ((BuildContext context) => VerseScreenProvider()),
        ),
        ChangeNotifierProvider(
          create: ((BuildContext context) => BookmarkProvider()),
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