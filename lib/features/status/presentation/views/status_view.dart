import 'package:flutter/material.dart';
import 'package:whats_app/core/shared_widget/custom_appBar.dart';
import 'package:whats_app/features/status/presentation/views/widgets/status_views_body.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: StatusViewBody(),
    );
  }
}
