import 'package:flutter/material.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:whats_app/features/chat/presentation/views/widgets/custom_floating_action_button.dart';

import '../../../../core/shared_widget/custom_appBar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: ChatViewBody(),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
