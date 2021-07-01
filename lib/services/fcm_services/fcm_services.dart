import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FCMService {
  final FirebaseMessaging fcm = FirebaseMessaging.instance;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future initializeFCMService() async {
    if (Platform.isIOS) {
      if (Platform.isIOS) {
        fcm.requestPermission(
          alert: true,
          badge: true,
          announcement: true,
          sound: true,
        );

        // For IOS only
        fcm.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      }
    }

    // Get Token
    fcm.getToken().then((token) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("fcmToken", token.toString());
      print("Token -- $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("OnMessage received");
      print("Notification title -- ${event.notification?.title}");
      print("Notification body -- ${event.notification?.body}");

      Map<String, dynamic> notificationData = {
        "title": event.notification?.title,
        "body": event.notification?.body,
      };

      _handleNotification(notificationData);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  // Handle notifications
  Future<void> _handleNotification(Map<String, dynamic> response) async {
    var title = (Platform.isIOS) ? response['title'] : response['title'];

    var msg = (Platform.isIOS) ? response['body'] : response['body'];

    if (title != null && msg != null) {
      await _showNotification(title, msg, "payload");
    }
  }

  // Show Notification
  Future<void> _showNotification(
      String title, String body, String payload) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1001',
      'Notification',
      'Notification Channel',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      enableLights: true,
      enableVibration: true,
      playSound: true,
      showWhen: true,
    );

    const IOSNotificationDetails iosPlatformChannelSpecifics =
        IOSNotificationDetails();

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );
    var initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    await flutterLocalNotificationsPlugin
        .show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    )
        .catchError((e, stack) {
      print("error while showing notification : $e, $stack");
    });
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint("Notification payload : $payload");
    }
  }

  Future onDidReceiveLocalNotification(
    int? id,
    String? title,
    String? body,
    String? payload,
  ) async {
    print("ID - $id , title - $title , body - $body , payload - $payload");
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  print("Handling a background message: ${event.messageId}");
}
