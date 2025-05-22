import 'package:flutter/material.dart';

import '../../../../../core/themes/app_styles.dart';
import '../../../../../core/themes/colors.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.save,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: AppStyles.styleBold24(context).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
