import 'package:flutter/material.dart';
import 'package:whats_app/features/splash/presentation/view/widget/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // goToLogin();

    super.initState();
  }

  void goToLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      try {
        Navigator.pushNamed(context, '/login');
      } on Exception {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
