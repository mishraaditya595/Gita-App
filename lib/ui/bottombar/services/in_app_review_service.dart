import 'dart:async';
import 'package:in_app_review/in_app_review.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class InAppReviewService {
  showReviewAlert() async {
    final InAppReview inAppReview = InAppReview.instance;
    if(await checkShouldShowPrompt()) {
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
      }
    }
  }

  Future<bool> checkShouldShowPrompt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? lastShownTimestamp = prefs.getInt('LAST_IN_APP_REVIEW');
    int currentTime = DateTime.now().millisecondsSinceEpoch;

    if (lastShownTimestamp == null) {
      prefs.setInt("LAST_IN_APP_REVIEW", currentTime);
      return true;
    } else {
      // Check if the current time is greater than the last shown timestamp + 2 weeks (in milliseconds)
      int twoWeeksInMilliseconds = 14 * 24 * 60 * 60 * 1000;
      // int twoMinutesInMilliseconds = 2 * 60 * 1000;
      return currentTime > (lastShownTimestamp + twoWeeksInMilliseconds);
    }
  }
}