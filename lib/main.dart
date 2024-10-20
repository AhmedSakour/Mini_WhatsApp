import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_theme.dart';
import 'package:whats_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:whats_app/features/home/presentation/views/bottom_navigation_bar_view.dart';
import 'package:whats_app/features/home/presentation/views/home_view.dart';

import 'features/app_layout/presentation/view/app_layout_view.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'features/splash/presentation/view/splash_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //I Hide firebase options file in gitignore
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
      enabled: true,
      builder: (context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.lightTheme(context),
      initialRoute: '/',
      routes: {
        '/': (context) => const AppLayoutView(),
        '/splash': (context) => const SplashView(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const SignUpView(),
        '/home': (context) => const HomeView(),
        '/bottomNav': (context) => const BottomNavigationBarView(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
