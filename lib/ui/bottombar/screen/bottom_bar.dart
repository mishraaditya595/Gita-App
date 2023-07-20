import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/colour_constants.dart';
import '../../../utils/hexcolor.dart';
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
      ),
    );
  }
}
