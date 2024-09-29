import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/services/notification/chat_notification_service.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Consumer<ChatNotificationService>(
        builder: (context, service, _) {
          if (service.notificationsCount == 0) {
            return Center(
              child: Text(
                'No notifications yet!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            );
          }
          return ListView.builder(
            itemCount: service.notificationsCount,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(service.notifications[index].title),
                subtitle: Text(service.notifications[index].body),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    service.removeNotification(index: index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
