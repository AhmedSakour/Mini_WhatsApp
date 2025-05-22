import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/features/home/data/models/chat_model.dart';

import '../../../../../core/themes/app_styles.dart';

class ChatListViewItem extends StatelessWidget {
  const ChatListViewItem({
    super.key,
    required this.chatModel,
  });
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
              imageUrl: chatModel.image,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chatModel.name,
                style: AppStyles.styleBold24(context),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  chatModel.lastMessage,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppStyles.styleMedium20(context),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${chatModel.lastMessageTime.hour}:${chatModel.lastMessageTime.minute}${chatModel.lastMessageTime.hour >= 12 ? ' PM' : ' AM'}',
                style: AppStyles.styleRegular16(context),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        )
      ],
    );
  }
}
