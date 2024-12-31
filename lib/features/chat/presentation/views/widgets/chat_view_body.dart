import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/getUserInfoCach.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';
import 'package:whats_app/features/chat/presentation/view_model/addMessage_cubit/add_message_cubit.dart';
import 'package:whats_app/features/chat/presentation/view_model/message_cubit/messages_cubit.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/custom_chatMessage_textField.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/custom_chatMessages_listview.dart';
import 'package:whats_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  getMessages() async {
    await BlocProvider.of<MessagesCubit>(context)
        .getMessages(widget.userModel.id);
  }

  getChats() async {
    await BlocProvider.of<HomeCubit>(context).getChats();
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
    List<MessageModel> messages = [];
    List<MessageModel> messagesLoading = [];
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: BlocConsumer<MessagesCubit, MessagesState>(
            listener: (context, state) {
              if (state is GetMessagesSuccess) {
                messagesLoading += state.messages;
                messages += state.messages;
              }
            },
            builder: (context, state) {
              if (state is GetMessagesSuccess) {
                return ChatMessagesListView(
                  userId: id!,
                  messages: messages,
                );
              } else if (state is GetMessagesLoading) {
                return ChatMessagesListView(
                  userId: id ?? "",
                  messages: messagesLoading,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        BlocListener<AddMessageCubit, AddMessageState>(
          listener: (context, state) {
            if (state is AddMessageSuccess) {
              messages = [];
              getMessages();
              getChats();
            }
          },
          child: CustomChatMessageTextField(
            userModel: widget.userModel,
            idUser: '$id',
          ),
        )
      ],
    );
  }
}
