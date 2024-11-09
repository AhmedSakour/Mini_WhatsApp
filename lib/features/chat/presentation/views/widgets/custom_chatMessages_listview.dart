import 'package:flutter/material.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/chatBubble_recivedMessage.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/chatBubble_sendMessage.dart';

class ChatMessagesListView extends StatelessWidget {
  const ChatMessagesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      reverse: true,
      itemBuilder: (context, index) {
        return index % 2 == 0
            ? const ChatbubbleSendmessage(message: 'hello , how are you')
            : const ChatbubbleRecivedmessage(message: 'fine thank you');
      },
    );
  }
}
