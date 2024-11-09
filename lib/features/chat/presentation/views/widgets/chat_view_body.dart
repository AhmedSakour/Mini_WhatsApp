import 'package:flutter/material.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/custom_chatMessage_textField.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/custom_chatMessages_listview.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: ChatMessagesListView(),
        ),
        CustomChatMessageTextField()
      ],
    );
  }
}
