import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:sbg/ui/bookmark/screen/bookmark_page.dart';
import 'package:sbg/ui/settings/screen/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';

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

    String receivedPromoId = params['promo-id'] ?? '';

    print("Redirecting to $receivedPromoId");

    if (receivedPromoId.isEmpty) return;
    _promoId = receivedPromoId;

    print("Promo id is $_promoId");

    if (_promoId == 'ABC1') {
      ContextUtility.navigator?.pushNamed(SettingsScreen.routeName);
      if(ContextUtility.navigator == null) {
        print("Missed deep link triggered");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("MISSED_DEEP_LINK", _promoId);
      }
    }

    if (_promoId == 'ABC2') {
      ContextUtility.navigator?.push(
        MaterialPageRoute(builder: (_) => const BookmarkPage()),
      );
    }
  }
}