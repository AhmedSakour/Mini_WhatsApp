import 'package:flutter/material.dart';

import 'friends_status_section.dart';

class RecentFriendsStatusSectionListView extends StatelessWidget {
  const RecentFriendsStatusSectionListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: FriendsStatusSection(isViewed: false),
                ),
            childCount: 5));
  }
}
