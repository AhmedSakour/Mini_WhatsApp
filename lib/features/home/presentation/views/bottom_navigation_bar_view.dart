import 'package:flutter/material.dart';
import 'package:whats_app/core/shared_widget/custom_appBar.dart';
import 'package:whats_app/features/calls/presentation/views/calls_view.dart';
import 'package:whats_app/features/home/presentation/views/home_view.dart';
import 'package:whats_app/features/status/presentation/views/status_view.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  final List<Widget> pages = [
    const HomeView(),
    const StatusView(),
    const CallsView(),
  ];
  int selectIndex = 0;
  onTap(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb), label: 'Status'),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Calls'),
          ]),
    );
  }
}
