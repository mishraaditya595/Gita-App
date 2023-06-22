import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class FirebaseMessagingService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<String?> getToken() async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    String? token = await fcm.getToken();
    print('FCM Token: $token');
    return token;
  }

  Future<FlutterLocalNotificationsPlugin> initializeLocalNotifications() async {
    await getToken();
    return flutterLocalNotificationsPlugin;
  }

  String screenRedirectionInfo = "notification";
  String category = '';
  String productCategory = '';

  // This method listens for notifications from FCM.
  Future listenToMessages() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint("onMessage: ${message.data["description"]}");
      await showNotification(message);
    });
  }

  // This method displays a notification to the user.
  Future<void> showNotification(RemoteMessage message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("MESSAGE: $message");
    const String groupKeyValue = "SELLINA";
    try {
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "default_channel_id",
        "default notification channel",
        channelDescription: '',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        groupKey: groupKeyValue,
        largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      );

      var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

      var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );

      String imageUrl = message.notification?.android?.imageUrl ?? '';
      String title = message.notification?.title ?? '';
      String body = message.notification?.body ?? '';


      var initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
      var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
          onDidReceiveNotificationResponse: (notificationResponse) async {
            Map? payload = jsonDecode(notificationResponse.payload!);
            if (payload != null) {
              // handleNavigation(payload['feature'], payload["category"] ?? '',
              //     payload["productCategory"] ?? '');

              List<String>? readNotifications =
              prefs.getStringList("x-read-notifications");

              if (readNotifications != null && readNotifications.isNotEmpty) {
                readNotifications.add(payload["notificationId"]);
                await prefs.setStringList(
                    "x-read-notifications", readNotifications);
              } else {
                await prefs.setStringList(
                    "x-read-notifications", [payload["notificationId"]]);
              }
            } else {
              // unawaited(SlackAlertService()
              //     .alert("Did not find payload for notification."));
            }
          });

      if (imageUrl.isNotEmpty ) {
        final http.Response response = await http.get(Uri.parse(imageUrl));

        BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
            ByteArrayAndroidBitmap.fromBase64String(
                base64Encode(response.bodyBytes)),
            contentTitle: title,
            summaryText: body,
            htmlFormatSummaryText: true,
            htmlFormatContentTitle: true,
            htmlFormatTitle: true,
            htmlFormatContent: true);

        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          "default_channel_id",
          "default notification channel",
          channelDescription: '',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          styleInformation: bigPictureStyleInformation,
          groupKey: groupKeyValue,
          largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        );

        if(title.isNotEmpty) {
          await flutterLocalNotificationsPlugin.show(getNotificationId(), title,
            body, NotificationDetails(android: androidPlatformChannelSpecifics),
            payload: ""
          );
        }
      } else {
        BigTextStyleInformation bigTextStyleInformation =
        BigTextStyleInformation(body,
            contentTitle: title,
            htmlFormatBigText: true,
            htmlFormatContentTitle: true);

        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          "default_channel_id",
          "default notification channel",
          channelDescription: '',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          styleInformation: bigTextStyleInformation,
          groupKey: groupKeyValue,
          largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        );

        if(title.isNotEmpty) {
          await flutterLocalNotificationsPlugin.show(getNotificationId(), title,
            body, NotificationDetails(android: androidPlatformChannelSpecifics),
            payload: ""
          );
        }
      }
    } on Exception catch (e) {
      print("Error in show notifications: $e");
      // await SlackAlertService().alert("Error in show notifications: $e");
    }
  }

  // Generate a unique notification ID
  int getNotificationId() {
    Random random = Random();
    return (random.nextInt(900000) +
        100000); // Generates a random number between 100000 and 999999
  }

  // This method handles navigation when the user taps on a notification.
  @pragma('vm:entry-point')
  static void handleNavigation(String screenFeature, String category,
      String productCategory) {

  }
}