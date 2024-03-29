import 'package:flutter/material.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/ui/bookmark/screen/bookmark_page.dart';
import 'package:sbg/ui/bottombar/screen/bottom_bar.dart';
import 'package:sbg/ui/library/screen/library_page.dart';
import 'package:sbg/ui/libraryhome/screen/library_home_page.dart';
import 'package:sbg/ui/loading/screen/loading_screen.dart';
import 'package:sbg/ui/settings/screen/settings_screen.dart';
import 'package:sbg/ui/verse/screen/verse_screen.dart';

import '../../ui/bookhome/screen/home_page.dart';
import '../../ui/chapter/screen/chapter_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  return MaterialPageRoute(builder: (BuildContext context) {
    switch (routeSettings.name) {
      case BottomBar.routeName:
        return const BottomBar(title: "title");
      case HomePage.routeName:
        BooksModel args = routeSettings.arguments as BooksModel;
        return HomePage(bookModel: args,);
      case BookmarkPage.routeName:
        return const BookmarkPage();
      case ChapterScreen.routeName:
        List args = routeSettings.arguments as List;
        return ChapterScreen(
          chapterNumber: args[0],
          chapterName: args[1],
          chapterSummary: args[2],
          booksModel: args[3],
        );
      case LibraryHomePage.routeName:
        return const LibraryHomePage();
      case LoadingScreen.routeName:
        return const LoadingScreen();
      case VerseScreen.routeName:
        ChapterDetailedModel args = routeSettings.arguments as ChapterDetailedModel;
        return VerseScreen(
            chapterNumber: int.parse(args.chapterNumber),
            verseNumber: args.verseNumberInt,
            verseDetails: args
        );
      case LibraryPage.routeName:
        return const LibraryPage();
      case SettingsScreen.routeName:
        return const SettingsScreen();
      default:
        return const BottomAppBar();
    }
  }
  );
}