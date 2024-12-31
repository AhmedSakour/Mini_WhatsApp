import 'package:flutter/material.dart';
import 'package:whats_app/core/constant/app_routes.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/home/data/models/chat_model.dart';

import 'chat_list_view_item.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
    required this.chats,
  });
  final List<ChatModel> chats;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.chat,
                    arguments: UserModel(
                        name: chats[index].name,
                        email: '',
                        password: '',
                        phone: '',
                        id: chats[index].userId));
              },
              child: ChatListViewItem(
                chatModel: chats[index],
              )),
        );
      },
    );
  }
}
