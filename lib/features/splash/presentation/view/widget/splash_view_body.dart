import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';

import '../../../../../core/shared_widget/whats_app_logo_section.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const WhatsAppLogoSection(),
        Text('WhatsUp', style: AppStyles.styleBold30(context)),
        const SizedBox(
          height: 60,
        ),
        Text(
          'The best chat app for this century',
          style: AppStyles.styleMedium20(context),
        )
      ],
    );
  }
}
