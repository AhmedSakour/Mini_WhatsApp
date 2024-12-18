import 'package:flutter/material.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/custom_chatview_appBar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        ModalRoute.of(context)?.settings.arguments as UserModel;
    return Scaffold(
      appBar: CustomChatviewAppbar(
        name: userModel.name,
      ),
      body: const ChatViewBody(),
    );
  }
}
