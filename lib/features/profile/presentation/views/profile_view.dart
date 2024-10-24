import 'package:flutter/material.dart';
import 'package:whats_app/features/profile/presentation/views/widgets/custom_profile_appBar.dart';
import 'package:whats_app/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomProfileAppBar(),
      body: ProfileViewBody(),
    );
  }
}
