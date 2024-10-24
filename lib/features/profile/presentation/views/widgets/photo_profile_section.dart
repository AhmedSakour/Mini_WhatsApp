import 'package:flutter/material.dart';

import '../../../../../core/constant/app_images.dart';
import '../../../../../core/themes/colors.dart';

class PhotoProfileSection extends StatelessWidget {
  const PhotoProfileSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesPerson),
            radius: 60,
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
