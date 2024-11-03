import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/components/messages.dart';
import 'package:projeto_firebase_chat/components/new_message.dart';
import 'package:projeto_firebase_chat/routes/app_routes.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';
import 'package:projeto_firebase_chat/services/notification/chat_notification_service.dart';
import 'package:provider/provider.dart';
// ---------------------------------------------------------------------
//  Importe necessário apenas quando for utilizar notificações mockadas
// ---------------------------------------------------------------------
//
// import 'package:projeto_firebase_chat/models/chat_notification.dart';
//

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        leading: IconButton(
          onPressed: () {
            AuthService().logout();
          },
          icon: const Icon(Icons.meeting_room),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.notifications);
                  }),
              Consumer<ChatNotificationService>(
                builder: (context, service, _) {
                  if (service.notificationsPopUpCount != '0') {
                    return Positioned(
                      top: 5,
                      right: 5,
                      child: CircleAvatar(
                        maxRadius: 10,
                        backgroundColor: Colors.redAccent,
                        child: Text(
                          service.notificationsPopUpCount,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ],
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
      // -------------------------------------------------
      // Botão para adicionar notificação de forma mockada
      // -------------------------------------------------
      //
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(
      //       context,
      //       listen: false,
      //     ).addNotification(
      //       notification: ChatNotification(
      //         title: 'New Chat',
      //         body: 'New message received from user',
      //       ),
      //     );
      //   },
      //   backgroundColor: Colors.blue,
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
