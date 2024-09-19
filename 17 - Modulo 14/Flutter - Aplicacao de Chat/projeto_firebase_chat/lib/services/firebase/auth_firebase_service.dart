import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:projeto_firebase_chat/models/auth.dart';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';

class AuthFirebaseService implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static ChatUser? _currentUser;
  static final Stream<ChatUser?> _userStreamController =
      Stream<ChatUser?>.multi(
    (controller) async {
      final authChanges = FirebaseAuth.instance.authStateChanges();

      await for (final User? user in authChanges) {
        _currentUser = _getUser(user);
        controller.add(_currentUser);
      }
    },
  );

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get onAuthStateChanged => _userStreamController;

  @override
  Future<void> login(Auth auth) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: auth.email,
      password: auth.password,
    );
  }

  @override
  Future<void> register(Auth auth) async {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: auth.email,
      password: auth.password,
    );

    final user = userCredential.user;

    if (user == null) throw Exception('User not found');

    final String? imagePath = await _uploadUserImage(
      image: auth.image!,
      imageName: '${user.uid}.jpg',
    );

    await user.updateDisplayName(auth.nickname);
    await user.updatePhotoURL(imagePath);

    _currentUser = ChatUser(
      id: user.uid,
      name: auth.nickname,
      email: auth.email,
      imagePath: imagePath,
    );

    await _saveChatUser(user: _currentUser!);
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> _saveChatUser({required ChatUser user}) async {
    final docRef = _firebaseFirestore.collection('users').doc(user.id);

    return await docRef.set({
      'name': user.name,
      'email': user.email,
      'imagePath': user.imagePath,
    });
  }

  Future<String?> _uploadUserImage({
    required File image,
    required String imageName,
  }) async {
    final Reference storageReference =
        _firebaseStorage.ref().child('users_images').child(imageName);
    final TaskSnapshot taskSnapshot =
        await storageReference.putFile(image).whenComplete(() {});

    return await taskSnapshot.ref.getDownloadURL();
  }

  static ChatUser? _getUser(User? user) {
    if (user == null) return null;

    return ChatUser(
      id: user.uid,
      name: user.displayName ?? user.email!.split('@').first,
      email: user.email!,
      imagePath: user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
