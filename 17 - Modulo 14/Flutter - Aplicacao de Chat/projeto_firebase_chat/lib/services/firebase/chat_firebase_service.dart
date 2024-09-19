import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/models/message.dart';
import 'package:projeto_firebase_chat/services/chat/chat_service.dart';

class ChatFirebaseService implements ChatService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<List<Message>?> getMessages() {
    return _firebaseFirestore
        .collection('messages')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        )
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => doc.data(),
              )
              .toList(),
        );
  }

  @override
  Future<Message> save({
    required String message,
    required ChatUser user,
  }) async {
    final docRef = await _firebaseFirestore
        .collection('messages')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        )
        .add(user.toMessage(message: message));

    final dataSnapshot = await docRef
        .get()
        .then(
          (value) => value.data(),
        )
        .catchError(
          (error) => null,
        );

    if (dataSnapshot == null) {
      return Future.error('Failed to send message');
    }

    return dataSnapshot;
  }

  Message _fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    return Message(
      id: snapshot.id,
      text: snapshot['text'],
      createdAt: DateTime.parse(snapshot['createdAt']),
      userId: snapshot['userId'],
      userName: snapshot['userName'],
      userImagePath: snapshot['userImagePath'],
    );
  }

  Map<String, dynamic> _toFirestore(
    Message message,
    SetOptions? options,
  ) {
    return {
      'text': message.text,
      'createdAt': message.createdAt.toIso8601String(),
      'userId': message.userId,
      'userName': message.userName,
      'userImagePath': message.userImagePath,
    };
  }
}
