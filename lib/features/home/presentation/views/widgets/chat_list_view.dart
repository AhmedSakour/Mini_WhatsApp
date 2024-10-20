import 'package:flutter/material.dart';

import 'chat_list_view_item.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ChatListViewItem(),
        );
      },
    );
  }
}
