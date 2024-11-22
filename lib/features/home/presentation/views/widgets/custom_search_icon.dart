import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/colors.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColor.thirdyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          Icons.search,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
