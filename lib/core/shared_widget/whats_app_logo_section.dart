import 'package:flutter/material.dart';

import '../constant/app_images.dart';

class WhatsAppLogoSection extends StatelessWidget {
  const WhatsAppLogoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.imagesWhatsAppLogo,
        width: 300,
        height: 250,
      ),
    );
  }
}
