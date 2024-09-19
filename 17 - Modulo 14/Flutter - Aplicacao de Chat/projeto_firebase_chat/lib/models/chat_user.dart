class ChatUser {
  final String id;
  final String name;
  final String email;
  final String? imagePath;

  const ChatUser({
    required this.id,
    required this.name,
    required this.email,
    this.imagePath,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imagePath': imagePath,
    };
  }
}
