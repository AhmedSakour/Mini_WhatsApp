import 'package:flutter/material.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/custom_chatview_appBar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomChatviewAppbar(
        name: 'rowan',
      ),
      body: ChatViewBody(),
    );
  }
}
