import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/app_layout/presentation/view/app_layout_view.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/splash/presentation/view/splash_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //I Hide firebase options file in gitignore
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AppLayoutView(),
        '/home': (context) => const HomeView(),
        '/splash': (context) => const SplashView(),
        '/login': (context) => const LoginView(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
