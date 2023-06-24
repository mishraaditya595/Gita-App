import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
          extendBody: true,
        bottomNavigationBar: DotNavigationBar(
          borderRadius: 20,
          marginR : const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
          paddingR : const EdgeInsets.only(bottom: 3, top: 3),
          enablePaddingAnimation: false,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.orange,
          onTap: _onItemTapped,
          items: [
            DotNavigationBarItem(
              icon: selectedIndex == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined) ,

            ),
            DotNavigationBarItem(
              icon: selectedIndex == 1
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_outline),

            ),
            DotNavigationBarItem(
              icon: selectedIndex == 2
                  ? const Icon(Icons.info)
                  : const Icon(Icons.info_outline),

            ),
          ],
        ),
      ),
    );
  }
}