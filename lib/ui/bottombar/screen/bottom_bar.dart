import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:sbg/ui/bottombar/services/in_app_review_service.dart';
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
          backgroundColor: HexColor(ColourConstants.offWhite),
          title: SizedBox(
            height: AppBar().preferredSize.height * 0.9,
            child: Image.asset("assets/images/bhagavad-gita.png"),
          ),
          centerTitle: true,
          actions: const [],
        ),
        body: pages[selectedIndex],
        extendBody: false,
        bottomNavigationBar: CurvedNavigationBar(
            height: kBottomNavigationBarHeight,
            backgroundColor: HexColor(ColourConstants.antiqueBrass),
            iconPadding: 8,
            items: [
              CurvedNavigationBarItem(
                child: selectedIndex == 0
                    ? const Icon(Icons.home_filled)
                    : const Icon(Icons.home_outlined),
                label: 'Home',
              ),
              CurvedNavigationBarItem(
                child: selectedIndex == 1
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_outline),
                label: 'My Bookmarks',
              ),
              CurvedNavigationBarItem(
                child: selectedIndex == 2
                    ? const Icon(Icons.info)
                    : const Icon(Icons.info_outline),
                label: 'Info',
              ),
            ],
            onTap: _onItemTapped),

        // DotNavigationBar(
        //   borderRadius: 20,
        //   // marginR : const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
        //   // paddingR : const EdgeInsets.only(bottom: 3, top: 3),
        //   //
        //   enablePaddingAnimation: false,
        //   currentIndex: selectedIndex,
        //   selectedItemColor: Colors.white,
        //   unselectedItemColor: Colors.white,
        //   backgroundColor: HexColor(ColourConstants.fiord),
        //   onTap: _onItemTapped,
        //   items: [
        //     DotNavigationBarItem(
        //       icon: selectedIndex == 0
        //           ? const Icon(Icons.home)
        //           : const Icon(Icons.home_outlined) ,
        //     ),
        //     DotNavigationBarItem(
        //       icon: selectedIndex == 1
        //           ? const Icon(Icons.bookmark)
        //           : const Icon(Icons.bookmark_outline),
        //     ),
        //     DotNavigationBarItem(
        //       icon: selectedIndex == 2
        //           ? const Icon(Icons.info)
        //           : const Icon(Icons.info_outline),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
