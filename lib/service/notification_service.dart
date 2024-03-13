import 'dart:async';
import 'dart:io';

import 'package:agrota_admin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
InitializationSettings initializationSettings = const InitializationSettings(
  android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  iOS: DarwinInitializationSettings(),
);

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

Future<void> initFCM() async {
  // Request permission for iOS devices and get the token
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    provisional: false,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');

    // Use the _firebaseMessaging instance to get the token
    String? token = await _firebaseMessaging.getToken();
    print("Firebase Messaging Token: $token");
  } else {
    print('User declined or has not accepted permission');
  }
}

sealed class NotificationService {
  const NotificationService._();

  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setupFlutterNotifications();
    foregroundNotification();
    backgroundNotification();
    await terminateNotification();
    initFCM();
    try {
      await FirebaseMessaging.instance.subscribeToTopic('notifications');
      print("Subscribed");
    } catch (e) {
      print("Could not subscribed $e");
    }
  }

  static Future<void> setupFlutterNotifications() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission(
        announcement: true,
      );
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static void showFlutterNotification(RemoteMessage message) {
    print("Local notif shown ${message.data}");
    final RemoteNotification? notification = message.notification;
    if (message.data.isNotEmpty && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        message.data['title'],
        message.data['body'],
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            styleInformation: BigTextStyleInformation(
              message.data['body'] ?? '',
              contentTitle: message.data['title'],
            ),
            icon: '@mipmap/ic_launcher',
            priority: Priority.high,
            importance: Importance.high,
            visibility: NotificationVisibility.public,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
      );
    }
  }

  static void foregroundNotification() {
    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    ///When tapped
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (response) async {
      debugPrint('foreground notification tapped');
      debugPrint('$response');
    });
  }

  static void backgroundNotification() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        debugPrint('A new onMessageOpenedApp event was published!');
        showFlutterNotification(message);
      },
    );
  }

  static Future<void> terminateNotification() async {
    final RemoteMessage? remoteMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage == null) {
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
    } else {
      showFlutterNotification(remoteMessage);
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationService.setupFlutterNotifications();
  NotificationService.showFlutterNotification(message);
}
