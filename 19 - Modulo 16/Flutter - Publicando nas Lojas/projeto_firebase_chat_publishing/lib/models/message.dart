class Message {
  final String id;
  final String text;
  final DateTime createdAt;
  final String userId;
  final String userName;
  final String userImagePath;

  Message({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
    required this.userName,
    required this.userImagePath,
  });
}
