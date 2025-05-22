class ChatModel {
  final String lastMessage;
  final String image;
  final String name;
  final DateTime lastMessageTime;
  final String userId;

  ChatModel(
      {required this.lastMessage,
      required this.image,
      required this.userId,
      required this.lastMessageTime,
      required this.name});
}
