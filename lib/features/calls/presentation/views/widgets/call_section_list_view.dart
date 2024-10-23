import 'package:flutter/material.dart';
import 'package:whats_app/features/calls/presentation/views/widgets/call_section.dart';

class CallsSectionListView extends StatelessWidget {
  const CallsSectionListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CallSection(),
                ),
            childCount: 5));
  }
}
