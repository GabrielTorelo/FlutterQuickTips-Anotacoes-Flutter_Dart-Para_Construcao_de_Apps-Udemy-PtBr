import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/components/without_data.dart';
import 'package:projeto_firebase_chat/models/message.dart';
import 'package:projeto_firebase_chat/services/chat/chat_service.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Message>?>(
        stream: ChatService().getMessages(),
        builder: (ctx, snapshot) {
          return switch (snapshot.connectionState) {
            ConnectionState.waiting => const Center(
                child: CircularProgressIndicator(),
              ),
            ConnectionState.active =>
              snapshot.hasData && snapshot.data!.isNotEmpty
                  ? ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, index) {
                        final message = snapshot.data![index];
                        return ListTile(
                          title: Text(message.text),
                          subtitle: Text(message.userName),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(message.userImagePath),
                          ),
                        );
                      },
                    )
                  : const WithoutData(),
            _ => const WithoutData(),
          };
        },
      ),
    );
  }
}
