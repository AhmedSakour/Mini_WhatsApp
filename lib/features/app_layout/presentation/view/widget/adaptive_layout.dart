import 'package:flutter/widgets.dart';
import 'package:whats_app/core/constant/size_config.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});
  final WidgetBuilder mobile, tablet, desktop;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < SizeConfig.tablet) {
          return mobile(context);
        } else if (constraints.maxWidth < SizeConfig.desktop) {
          return tablet(context);
        } else {
          return desktop(context);
        }
      },
    );
  }
}
