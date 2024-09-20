import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/models/chat_notification.dart';

class ChatNotificationService with ChangeNotifier {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final List<ChatNotification> _notifications = [];

  List<ChatNotification> get notifications => [..._notifications];

  int get notificationsCount => _notifications.length;

  String get notificationsPopUpCount {
    if (notificationsCount > 9) {
      return '+9';
    }

    return notificationsCount.toString();
  }

  Future<bool> get _isAuthorized async {
    final NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    final bool isAuthorized =
        settings.authorizationStatus == AuthorizationStatus.authorized;

    return isAuthorized;
  }

  void addNotification({required ChatNotification notification}) {
    _notifications.add(notification);

    notifyListeners();
  }

  void removeNotification({required int index}) {
    _notifications.removeAt(index);

    notifyListeners();
  }

  Future<void> init() async {
    await _configureTerminated();
    await _configureForeground();
    await _configureBackground();
  }

  Future<void> _configureForeground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessage.listen(_messageHandler);
    }
  }

  Future<void> _configureBackground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessageOpenedApp.listen(_messageHandler);
    }
  }

  Future<void> _configureTerminated() async {
    if (await _isAuthorized) {
      final RemoteMessage? message =
          await _firebaseMessaging.getInitialMessage();

      _messageHandler(message);
    }
  }

  void _messageHandler(RemoteMessage? message) {
    if (message == null || message.notification == null) return;

    addNotification(
      notification: ChatNotification(
        title: message.notification?.title ?? 'Not informed!',
        body: message.notification?.body ?? 'Not informed!',
      ),
    );
  }
}
