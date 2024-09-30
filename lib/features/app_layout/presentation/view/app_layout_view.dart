import 'package:flutter/material.dart';
import 'package:whats_app/features/app_layout/presentation/view/widget/adaptive_layout.dart';
import 'package:whats_app/features/app_layout/presentation/view/widget/desktop_layout.dart';
import 'package:whats_app/features/app_layout/presentation/view/widget/mobile_layout.dart';
import 'package:whats_app/features/app_layout/presentation/view/widget/tablet_layout.dart';

class AppLayoutView extends StatelessWidget {
  const AppLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const MobileLayout(),
      desktop: (context) => const DesktopLayout(),
      tablet: (context) => const TabletLayout(),
    );
  }
}
