import 'package:flutter/material.dart';

import '../constant/app_images.dart';

class WhatsAppLogoSection extends StatelessWidget {
  const WhatsAppLogoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(Assets.imagesWhatsAppLogo,
          width: MediaQuery.sizeOf(context).height / 2,
          height: MediaQuery.sizeOf(context).width / 1.5),
    );
  }
}
