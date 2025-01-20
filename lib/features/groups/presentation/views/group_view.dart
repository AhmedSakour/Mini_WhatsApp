import 'package:flutter/material.dart';
import 'package:whats_app/features/groups/presentation/views/widgest/custom_appbar_group.dart';
import 'package:whats_app/features/groups/presentation/views/widgest/group_view_body.dart';

class GroupView extends StatelessWidget {
  const GroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarGroup(),
      body: GroupViewBody(),
    );
  }
}
