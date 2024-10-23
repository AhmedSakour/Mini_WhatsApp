import 'package:flutter/material.dart';

import '../../../../../core/constant/app_images.dart';
import '../../../../../core/themes/app_styles.dart';

class CallSection extends StatelessWidget {
  const CallSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(
                  Assets.imagesPerson,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmad Sakour',
                style: AppStyles.styleBold24(context),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                'Today, 12:00 PM',
                style: AppStyles.styleExtrabold19(context),
              ),
            ],
          ),
        ),
        Expanded(
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.call)))
      ],
    );
  }
}
