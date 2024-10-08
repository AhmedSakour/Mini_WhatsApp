import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';

import '../../../../../core/constant/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          Assets.imagesWhatsAppLogo,
          fit: BoxFit.cover,
          width: 300,
          height: 300,
        )),
        Text('WhatsUp', style: AppStyles.styleBold30),
        const SizedBox(
          height: 60,
        ),
        Text(
          'The best chat app for this century',
          style: AppStyles.styleMedium20,
        )
      ],
    );
  }
}
