import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/colors.dart';

import '../../../../../core/constant/app_images.dart';
import '../../../../../core/themes/app_styles.dart';

class FriendsStatusSection extends StatelessWidget {
  const FriendsStatusSection({
    Key? key,
    required this.isViewed,
  }) : super(key: key);
  final bool isViewed;

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
              border: Border.all(
                width: 2,
                color: isViewed ? Colors.grey : AppColor.primaryColor,
              )),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
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
      ],
    );
  }
}
