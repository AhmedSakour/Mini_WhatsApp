import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/features/status/presentation/views/widgets/recent_friends_status_list_view.dart';
import 'package:whats_app/features/status/presentation/views/widgets/viewed_friends_status_section_list_view.dart';

import 'my_status_section.dart';

class StatusViewBody extends StatelessWidget {
  const StatusViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: MyStatusSection()),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 30,
          )),
          SliverToBoxAdapter(
            child: Text(
              'Recent updates',
              style: AppStyles.styleExtrabold19(context),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          const RecentFriendsStatusSectionListView(),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 30,
          )),
          SliverToBoxAdapter(
            child: Text(
              'Viewed updates',
              style: AppStyles.styleExtrabold19(context),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          const ViewedFriendsStatusSectionListView(),
        ],
      ),
    );
  }
}
