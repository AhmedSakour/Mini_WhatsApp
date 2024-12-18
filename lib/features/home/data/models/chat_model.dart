class ChatModel {
  final String lastMessage;
  final String image;
  final String name;
  final String lastMessageTime;

  ChatModel(
      {required this.lastMessage,
      required this.image,
      required this.lastMessageTime,
      required this.name});
}
