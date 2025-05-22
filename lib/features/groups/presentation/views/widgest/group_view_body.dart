import 'package:flutter/material.dart';
import 'package:whats_app/features/groups/presentation/views/widgest/custom_group_textfield.dart';
import 'package:whats_app/features/groups/presentation/views/widgest/group_listview.dart';

class GroupViewBody extends StatelessWidget {
  const GroupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomGroupTextfield(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Grouplistview(),
          )
        ],
      ),
    );
  }
}
