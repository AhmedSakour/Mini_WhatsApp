import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/getUserInfoCach.dart';
import 'package:whats_app/features/chat/presentation/view_model/message_cubit/messages_cubit.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/custom_chatMessage_textField.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/custom_chatMessages_listview.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key, required this.id});
  final String id;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  getMessages() async {
    await BlocProvider.of<MessagesCubit>(context).getMessages(widget.id);
  }

  getUserId() async {
    id = await UserInfoCache.getUserId();
  }

  @override
  void initState() {
    getMessages();
    getUserId();
    super.initState();
  }

  String? id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: BlocBuilder<MessagesCubit, MessagesState>(
            builder: (context, state) {
              if (state is GetMessagesSuccess) {
                return ChatMessagesListView(
                  userId: id!,
                  messages: state.messages,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        const CustomChatMessageTextField()
      ],
    );
  }
}
