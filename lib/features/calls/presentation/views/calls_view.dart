import 'package:flutter/material.dart';
import 'package:whats_app/features/calls/presentation/views/widgets/calls_view_body.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CallsViewBody(),
    );
  }
}
