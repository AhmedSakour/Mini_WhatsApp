import 'package:flutter/material.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/chatBubble_recivedMessage.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/chatBubble_sendMessage.dart';

class ChatMessagesListView extends StatelessWidget {
  const ChatMessagesListView({
    super.key,
    required this.messages,
    required this.userId,
  });
  final List<MessageModel> messages;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      reverse: true,
      itemBuilder: (context, index) {
        return messages[index].idSender == userId
            ? ChatbubbleSendmessage(message: messages[index].message)
            : ChatbubbleRecivedmessage(message: messages[index].message);
      },
    );
  }
}
