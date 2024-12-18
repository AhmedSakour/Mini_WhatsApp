import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';

import 'chat_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetChatsSuccess) {
          return ChatListView(
            chats: state.chats,
          );
        } else if (state is GetChatsFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
