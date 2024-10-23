import 'package:flutter/cupertino.dart';

import '../../../../../core/themes/app_styles.dart';
import 'call_section_list_view.dart';

class CallsViewBody extends StatelessWidget {
  const CallsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              'Recent',
              style: AppStyles.styleExtrabold19(context),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          const CallsSectionListView(),
        ],
      ),
    );
  }
}
