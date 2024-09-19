import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/models/message.dart';
import 'package:projeto_firebase_chat/services/chat/chat_factory_service.dart';

abstract class ChatService {
  Stream<List<Message>?> getMessages();
  Future<Message> save({required String message, required ChatUser user});

  factory ChatService() {
    // --------------------------------------------------------------------
    // Define se serão utilizados os dados Mockados ou os dados do Firebase
    // --------------------------------------------------------------------
    //
    // useMock: true => Serão utilizados os dados Mockados
    // useMock: false => Serão utilizados os dados do Firebase
    //
    return ChatFactoryService.createChatService(
      useMock: false,
    );
  }
}
