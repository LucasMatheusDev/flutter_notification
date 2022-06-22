import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:push_local_notification/modules/core/services/notification/entities/notification.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  late FlutterLocalNotificationsPlugin _localNotificationsPlugin;

  NotificationService() {
    _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotification();
  }

  void _setupNotification() async {
    await _setupTimeZone();
    await _initializeNotifications();
  }

  Future _setupTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future _initializeNotifications() {
    return _localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings(
          '@mipmap/ic_launcher',
        ),
        iOS: IOSInitializationSettings(
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestAlertPermission: true,
        ),
      ),
      onSelectNotification: _onSelectNotification,
    );
  }

  _onSelectNotification(String? payload) async {
    if (payload != null && payload.isNotEmpty) {
      debugPrint('notification payload: $payload');
      Get.offNamed(payload);
    }
  }

  showNotificationNow(CustomNotification notification) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'lembretes_notifications_x',
      'Lembretes',
      channelDescription: "Este é um canal de notificações",
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: IOSNotificationDetails(),
    );
    _localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      notificationDetails,
      payload: notification.payload,
    );
    const NotificationDetails(
      android: androidNotificationDetails,
    );
  }

  checkShowNotification() async {
    final details =
        await _localNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      _onSelectNotification(details.payload);
    }
  }

  scheduledNotification(CustomNotification notification, DateTime dateTime) {
    const scheduledNotification = NotificationDetails(
      android: AndroidNotificationDetails(
        'lembretes_notifications_x',
        'Lembretes',
        channelDescription: "Este é um canal de notificações",
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      ),
      iOS: IOSNotificationDetails(),
    );
    _localNotificationsPlugin.zonedSchedule(
      1,
      'Notificação em 30 segundos',
      'Notificação em Consultório Andrade',
      tz.TZDateTime.from(dateTime, tz.local),
      scheduledNotification,
      payload: 'received_notification',
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
