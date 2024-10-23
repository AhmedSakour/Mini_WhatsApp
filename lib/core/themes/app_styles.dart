import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/colors.dart';

import '../constant/size_config.dart';

abstract class AppStyles {
  static TextStyle styleBold30(context) => TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 30),
      );
  static TextStyle styleBold24(context) => TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 24),
      );
  static TextStyle styleRegular16(context) => TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
        fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 16),
      );
  static TextStyle styleExtrabold19(context) => TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w800,
        fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 19),
      );

  static TextStyle styleMedium20(context) => TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 20),
      );
  static TextStyle styleRegular20(context) => TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 20),
      );

  static double getResponsiveFontSize(context, {required double fontSize}) {
    double scaleFactor = AppStyles.getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;
    double lowerlimit = fontSize * .8;
    double upperlimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerlimit, upperlimit);
  }

  static double getScaleFactor(context) {
    double width = MediaQuery.of(context).size.width;
    if (width < SizeConfig.tablet) {
      return width / 768;
    } else if (width < SizeConfig.desktop) {
      return width / 1000;
    } else {
      return width / 1920;
    }
  }
}
