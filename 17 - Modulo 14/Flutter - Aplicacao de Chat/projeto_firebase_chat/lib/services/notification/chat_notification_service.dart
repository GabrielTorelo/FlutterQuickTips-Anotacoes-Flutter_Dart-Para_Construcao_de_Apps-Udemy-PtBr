import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/models/chat_notification.dart';

class ChatNotificationService with ChangeNotifier {
  final List<ChatNotification> _notifications = [];

  List<ChatNotification> get notifications => [..._notifications];

  int get notificationsCount => _notifications.length;

  String get notificationsPopUpCount {
    if (notificationsCount > 9) {
      return '+9';
    }

    return notificationsCount.toString();
  }

  void addNotification({required ChatNotification notification}) {
    _notifications.add(notification);

    notifyListeners();
  }

  void removeNotification({required int index}) {
    _notifications.removeAt(index);

    notifyListeners();
  }
}
