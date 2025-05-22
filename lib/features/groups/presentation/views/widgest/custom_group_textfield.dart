import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/random_string.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/features/groups/data/models/group_model.dart';
import 'package:whats_app/features/groups/presentation/view_model/group_cubit/group_cubit.dart';

class CustomGroupTextfield extends StatelessWidget {
  const CustomGroupTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    var groupCubit = BlocProvider.of<GroupCubit>(context);
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter group name';
        }
        return null;
      },
      onChanged: (value) {
        groupCubit.setGroupModel(GroupModel(
            groupImage: 'https://cdn-icons-png.flaticon.com/512/681/681494.png',
            users: groupCubit.groupModel?.users ?? [],
            groupName: value,
            groupID: getRandomString(7),
            lastMessage: '',
            lastMessageTime: ''));
      },
      decoration: InputDecoration(
          hintText: 'enter the name of group',
          hintStyle: AppStyles.styleMedium20(context),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }
}
