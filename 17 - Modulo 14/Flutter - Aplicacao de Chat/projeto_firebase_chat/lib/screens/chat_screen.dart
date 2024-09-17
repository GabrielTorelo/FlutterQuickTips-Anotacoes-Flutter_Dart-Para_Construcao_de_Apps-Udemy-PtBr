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

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        actions: [
          DropdownButton(
            underline: Container(),
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            items: const [
              DropdownMenuItem(
                value: 'logout',
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.exit_to_app, color: Colors.black87),
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              switch (value) {
                case 'logout':
                  AuthService().logout();
                  break;
                default:
              }
            },
          ),
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
