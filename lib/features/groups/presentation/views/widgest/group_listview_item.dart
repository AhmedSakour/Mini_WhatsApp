import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/random_string.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/core/themes/colors.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/groups/data/models/group_model.dart';
import 'package:whats_app/features/groups/presentation/view_model/group_cubit/group_cubit.dart';

class GroupListviewItem extends StatefulWidget {
  const GroupListviewItem({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  State<GroupListviewItem> createState() => _GroupListviewItemState();
}

class _GroupListviewItemState extends State<GroupListviewItem> {
  bool isSelect = false;
  late GroupModel groupModel;
  List<UserModel> users = [];
  @override
  Widget build(BuildContext context) {
    var groupCubit = BlocProvider.of<GroupCubit>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 30,
          child: CachedNetworkImage(
            imageUrl: widget.user.imageProfile!,
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.name,
                style: AppStyles.styleBold24(context),
              ),
              Text(
                widget.user.phone,
                style: AppStyles.styleRegular16(context),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Checkbox(
            value: isSelect,
            activeColor: AppColor.primaryColor,
            onChanged: (value) {
              isSelect = value!;
              if (value) {
                users = groupCubit.groupModel?.users ?? [];
                users.add(widget.user);

                groupModel = GroupModel(
                    groupImage:
                        'https://cdn-icons-png.flaticon.com/512/681/681494.png',
                    users: users,
                    groupName: groupCubit.groupModel?.groupName ?? '',
                    groupID: getRandomString(7),
                    lastMessage: '',
                    lastMessageTime: '');
              } else {
                groupModel = GroupModel(
                    groupImage:
                        'https://cdn-icons-png.flaticon.com/512/681/681494.png',
                    users: groupCubit.groupModel?.users ?? [],
                    groupName: groupCubit.groupModel?.groupName ?? '',
                    groupID: getRandomString(7),
                    lastMessage: '',
                    lastMessageTime: '');
              }
              groupCubit.setGroupModel(groupModel);
              setState(() {});
            },
          ),
        )
      ],
    );
  }
}
