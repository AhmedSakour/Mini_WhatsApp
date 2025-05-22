import 'package:flutter/material.dart';
import 'package:whats_app/features/calls/presentation/views/widgets/calls_view_body.dart';

import '../../../../core/shared_widget/custom_appBar.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: CallsViewBody(),
    );
  }
}
