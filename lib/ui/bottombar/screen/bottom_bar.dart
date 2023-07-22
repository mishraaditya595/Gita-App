import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbg/ui/libraryhome/screen/library_home_page.dart';
import '../../../utils/colour_constants.dart';
import '../../../utils/hexcolor.dart';
import '../../bookmark/provider/bookmark_provider.dart';
import '../../bookmark/screen/bookmark_page.dart';
import '../../chapter/provider/chapter_screen_provider.dart';

import '../../others/about_page.dart';
import '../../verse/provider/verse_screen_provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual_home";
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
    const LibraryHomePage(),
    const BookmarkPage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:  Container(
          decoration:
          BoxDecoration(gradient: ColourConstants.homePageAppBarGradient),
        ),
        // backgroundColor: HexColor(ColourConstants.backgroundWhite),
        title: SizedBox(
          height: AppBar().preferredSize.height * 0.9,
          child: Image.asset("assets/images/bhagavad-gita.png"),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: pages[selectedIndex],
      extendBody: false,
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: HexColor(ColourConstants.backgroundWhite),
        fixedColor: HexColor(ColourConstants.antiqueBrass),
        selectedLabelStyle:  const TextStyle(
            fontWeight: FontWeight.bold),
        selectedIconTheme:
        IconThemeData(color: HexColor(ColourConstants.antiqueBrass)),
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
    );
  }
}
