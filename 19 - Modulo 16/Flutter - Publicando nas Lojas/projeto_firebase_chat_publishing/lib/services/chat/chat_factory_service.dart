import 'package:projeto_firebase_chat/services/MOCK/chat_mock_service.dart';
import 'package:projeto_firebase_chat/services/chat/chat_service.dart';
import 'package:projeto_firebase_chat/services/firebase/chat_firebase_service.dart';

class ChatFactoryService {
  static ChatService createChatService({bool useMock = true}) {
    if (useMock) {
      return ChatMockService();
    } else {
      return ChatFirebaseService();
    }
  }
}
