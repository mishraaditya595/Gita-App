import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/ui/bookhome/services/home_page_services.dart';
import 'package:sbg/ui/bookmark/screen/bookmark_page.dart';
import 'package:sbg/ui/chapter/screen/chapter_screen.dart';
import 'package:sbg/ui/chapter/services/chapter_screen_service.dart';
import 'package:sbg/ui/libraryhome/services/library_services.dart';
import 'package:sbg/ui/settings/screen/settings_screen.dart';
import 'package:sbg/ui/verse/screen/verse_screen.dart';
import 'package:sbg/ui/verse/services/verse_screen_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';

import '../../ui/bookhome/screen/home_page.dart';
import 'context_utility.dart';

@Singleton()
class UniLinksService {
  static String _promoId = '';
  static String get promoId => _promoId;
  static bool get hasPromoId => _promoId.isNotEmpty;

  static void reset() => _promoId = '';

  static Future<void> init({checkActualVersion = false}) async {
    // This is used for cases when: APP is not running and the user clicks on a link.
    try {
      final Uri? uri = await getInitialUri();
      if(uri == null) {
        print("null uri");
      } else {
        print("uri: ${uri.toString()}");
      }
      _uniLinkHandler(uri: uri);
    } on PlatformException catch(error){
      print("(PlatformException) Failed to receive initial uri.");
      FirebaseCrashlytics.instance.recordFlutterFatalError(
          FlutterErrorDetails(
              exception: Exception(
                  ["(PlatformException) Failed to receive initial uri. $error"]
              )
          )
      );
    } on FormatException catch (error) {
      print("(FormatException) Malformed Initial URI received. Error: $error");
      FirebaseCrashlytics.instance.recordFlutterFatalError(
          FlutterErrorDetails(
              exception: Exception(
                  ["(FormatException) Malformed Initial URI received. Error: $error"]
              )
          )
      );
    } on Exception catch (error) {
      print("Malformed Initial URI received. Error: $error");
      FirebaseCrashlytics.instance.recordFlutterFatalError(
          FlutterErrorDetails(
              exception: Exception(
                  ["Malformed Initial URI received. Error: $error"]
              )
          )
      );
    }

    // This is used for cases when: APP is already running and the user clicks on a link.
    uriLinkStream.listen((Uri? uri) async {
      if(uri == null) {
        print("null uri");
      } else {
        print("uri: ${uri.toString()}");
      }
      _uniLinkHandler(uri: uri);
    }, onError: (error) {
      print('UniLinks onUriLink error: $error');
      FirebaseCrashlytics.instance.recordFlutterFatalError(
          FlutterErrorDetails(
              exception: Exception(
                  ["UniLinks onUriLink error: $error"]
              )
          )
      );
    });
  }

  static Future<void> _uniLinkHandler({required Uri? uri}) async {
    if (uri == null || uri.queryParameters.isEmpty) return;
    Map<String, String> params = uri.queryParameters;

    print("Params receivied: ${params.toString()}");

    uniLinkRedirection(params: params);
  }

  static void uniLinkRedirection({required Map params, bool checkMissedUniLink = true}) async{
    String receivedBook = params['book'] ?? '';
    String receivedVerse = params['verse'] ?? '';

    if (receivedBook.isEmpty) return;

    if(ContextUtility.navigator != null) {
      if(receivedVerse.isEmpty) {
        LibraryService libraryService = GetIt.instance.get<LibraryService>();
        BooksModel? booksModel = libraryService.getBook(receivedBook);
        if(booksModel != null) {
          ContextUtility.navigator?.pushNamed(
              HomePage.routeName, arguments: booksModel);
        } else {
          FirebaseCrashlytics.instance.recordFlutterFatalError(
              FlutterErrorDetails(
                  exception: Exception(
                      ["Deep link error: not able to find book: $receivedBook"]
                  )
              )
          );
        }
      }
      else {
        List<String> verseDecoded = receivedVerse.split(".");
        if(verseDecoded.length > 1) {
          String chapterNum = verseDecoded[0];
          String verseNum = verseDecoded[1];

          if(verseNum == "32xze") {
            LibraryService libraryService = GetIt.instance.get<LibraryService>();
            BooksModel? booksModel = libraryService.getBook(receivedBook);
            HomePageServices homePageServices = GetIt.instance.get<HomePageServices>();
            ChapterSummaryModel? chapterSummaryModel = homePageServices.getChapterSummary(chapterNum, receivedBook);
            if(booksModel != null && chapterSummaryModel != null) {
              ContextUtility.navigator?.pushNamed(
                  ChapterScreen.routeName, arguments: [int.tryParse(chapterNum) ?? 0, chapterSummaryModel.nameTranslated, chapterSummaryModel.summary, booksModel]);
            } else {
              FirebaseCrashlytics.instance.recordFlutterFatalError(
                  FlutterErrorDetails(
                      exception: Exception(
                          [
                            "Deep link error: not able to find verse - $receivedVerse for book - $receivedBook"
                          ]
                      )
                  )
              );
            }
          } else {
            VerseScreenService verseScreenService = GetIt.instance.get<
                VerseScreenService>();
            ChapterDetailedModel? chapterDetailedModel = verseScreenService
                .getVerseDetails(chapterNum, verseNum, receivedBook);

            if (chapterDetailedModel != null) {
              ContextUtility.navigator?.pushNamed(
                  VerseScreen.routeName, arguments: chapterDetailedModel);
            } else {
              FirebaseCrashlytics.instance.recordFlutterFatalError(
                  FlutterErrorDetails(
                      exception: Exception(
                          [
                            "Deep link error: not able to find verse - $receivedVerse for book - $receivedBook"
                          ]
                      )
                  )
              );
            }
          }
        }

      }
    } else if(checkMissedUniLink) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("MISSED_DEEP_LINK", jsonEncode(params));
    }
  }
}