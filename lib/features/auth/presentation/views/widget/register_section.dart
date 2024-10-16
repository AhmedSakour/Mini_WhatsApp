import 'package:flutter/material.dart';

import '../../../../../core/themes/app_styles.dart';
import '../../../../../core/themes/colors.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: AppStyles.styleBold24(context),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text(
            'Register here',
            style: AppStyles.styleBold24(context)
                .copyWith(color: AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}
