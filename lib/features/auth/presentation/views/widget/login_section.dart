import 'package:flutter/material.dart';

import '../../../../../core/themes/app_styles.dart';
import '../../../../../core/themes/colors.dart';

class LogInSection extends StatelessWidget {
  const LogInSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppStyles.styleBold24(context),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            'Login here',
            style: AppStyles.styleBold24(context)
                .copyWith(color: AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}
