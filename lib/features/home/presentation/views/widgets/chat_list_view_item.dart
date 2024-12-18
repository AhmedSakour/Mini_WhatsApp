import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/features/home/data/models/chat_model.dart';

import '../../../../../core/themes/app_styles.dart';
import '../../../../../core/themes/colors.dart';

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
            backgroundColor: Colors.grey,
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
              Text(
                chatModel.lastMessage,
                style: AppStyles.styleMedium20(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chatModel.lastMessageTime,
                style: AppStyles.styleRegular16(context),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: CircleAvatar(
                    backgroundColor: AppColor.secondaryColor,
                    radius: 12,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '2',
                        style: AppStyles.styleRegular16(context)
                            .copyWith(color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
