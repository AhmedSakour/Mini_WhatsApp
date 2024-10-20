import 'package:flutter/material.dart';

import 'my_status_section.dart';

class StatusViewBody extends StatelessWidget {
  const StatusViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: const [
          MyStatusSection(),
        ],
      ),
    );
  }
}
