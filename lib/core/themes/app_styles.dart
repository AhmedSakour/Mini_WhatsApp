import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/colors.dart';

abstract class AppStyles {
  static TextStyle styleBold30 = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30);

  static TextStyle styleMedium20 = TextStyle(
      color: AppColor.primaryColor, fontWeight: FontWeight.w500, fontSize: 20);
}
