import 'package:flutter/cupertino.dart';

import '../../../../../core/constant/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      Assets.imagesWhatsAppLogo,
      fit: BoxFit.cover,
      width: 300,
      height: 300,
    ));
  }
}
