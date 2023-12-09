import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          importance: Importance.max, priority: Priority.high));
  static Future<void> init() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showNotification(String? title, String? body) async {
    await flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }
}
