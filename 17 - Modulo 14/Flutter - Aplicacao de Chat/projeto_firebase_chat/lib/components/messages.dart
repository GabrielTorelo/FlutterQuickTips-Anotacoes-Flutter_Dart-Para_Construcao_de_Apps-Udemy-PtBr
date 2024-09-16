import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/components/message_bubble.dart';
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
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      separatorBuilder: (ctx, index) =>
                          const SizedBox(height: 30),
                      reverse: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, index) {
                        return MessageBubble(
                          key: ValueKey(snapshot.data![index].id),
                          message: snapshot.data![index],
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
