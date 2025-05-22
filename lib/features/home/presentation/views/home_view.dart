import 'package:flutter/material.dart';
import 'package:whats_app/core/constant/app_routes.dart';
import 'package:whats_app/core/shared_widget/custom_floating_action_button.dart';
import 'package:whats_app/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../../core/shared_widget/custom_appBar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const HomeViewBody(),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.contacts);
        },
        icon: Icons.chat,
      ),
    );
  }
}
