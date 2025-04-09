import 'package:flutter/material.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/chatBubble_recivedMessage.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/chatBubble_sendMessage.dart';

class ChatMessagesListView extends StatelessWidget {
  const ChatMessagesListView({
    super.key,
    required this.messages,
    required this.userId,
    required this.isGroup,
  });
  final List<MessageModel> messages;
  final String userId;
  final bool isGroup;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      reverse: true,
      itemBuilder: (context, index) {
        return messages[index].idSender == userId
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ChatbubbleSendmessage(message: messages[index].message),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ChatbubbleRecivedmessage(
                  message: messages[index],
                  isGroup: isGroup,
                ),
              );
      },
    );
  }
}
