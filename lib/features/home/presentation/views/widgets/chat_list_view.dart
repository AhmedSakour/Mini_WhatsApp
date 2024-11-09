import 'package:flutter/material.dart';

import 'chat_list_view_item.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              child: const ChatListViewItem()),
        );
      },
    );
  }
}
