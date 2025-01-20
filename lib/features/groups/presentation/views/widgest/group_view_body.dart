import 'package:flutter/material.dart';
import 'package:whats_app/features/groups/presentation/views/widgest/custom_group_textfield.dart';
import 'package:whats_app/features/groups/presentation/views/widgest/group_listview_item.dart';

class GroupViewBody extends StatelessWidget {
  const GroupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CustomGroupTextfield(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                  child: GroupListviewItem(),
                );
              },
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
