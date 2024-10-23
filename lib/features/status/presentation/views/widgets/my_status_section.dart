import 'package:flutter/material.dart';

import '../../../../../core/constant/app_images.dart';
import '../../../../../core/themes/app_styles.dart';
import '../../../../../core/themes/colors.dart';

class MyStatusSection extends StatelessWidget {
  const MyStatusSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(Assets.imagesPerson),
              radius: 30,
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColor.secondaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: AppColor.secondaryColor,
                  size: 15,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Status',
              style: AppStyles.styleBold24(context),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Tap to add status update',
              style: AppStyles.styleExtrabold19(context),
            ),
          ],
        ),
      ],
    );
  }
}
