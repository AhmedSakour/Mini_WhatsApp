import 'package:flutter/material.dart';

import '../themes/app_styles.dart';
import '../themes/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        title,
        style: AppStyles.styleBold30(context).copyWith(color: Colors.white),
      )),
    );
  }
}
