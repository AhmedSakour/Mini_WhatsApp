import 'package:flutter/material.dart';
import 'package:whats_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:whats_app/features/home/presentation/views/widgets/custom_floating_action_button.dart';

import '../../../../core/shared_widget/custom_appBar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: HomeViewBody(),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
