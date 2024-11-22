// app_routes.dart

import 'package:flutter/material.dart';
import 'package:whats_app/features/app_layout/presentation/view/app_layout_view.dart';
import 'package:whats_app/features/auth/presentation/views/login_view.dart';
import 'package:whats_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:whats_app/features/chat/presentation/views/chat_view.dart';
import 'package:whats_app/features/home/presentation/views/bottom_navigation_bar_view.dart';
import 'package:whats_app/features/home/presentation/views/contacts_view.dart';
import 'package:whats_app/features/home/presentation/views/home_view.dart';
import 'package:whats_app/features/profile/presentation/views/profile_view.dart';
import 'package:whats_app/features/splash/presentation/view/splash_view.dart';

class AppRoutes {
  static const login = '/LoginView';
  static const signUp = '/SignView';
  static const home = '/HomeView';
  static const nav = '/BottomNavView';
  static const appLayout = '/';
  static const splash = '/splashView';
  static const profile = '/profileView';
  static const chat = '/chatView';
  static const contacts = '/contacts';
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      appLayout: (context) => const AppLayoutView(),
      login: (context) => const LoginView(),
      signUp: (context) => const SignUpView(),
      splash: (context) => const SplashView(),
      home: (context) => const HomeView(),
      nav: (context) => const BottomNavigationBarView(),
      profile: (context) => const ProfileView(),
      chat: (context) => const ChatView(),
      contacts: (context) => const ContactsView(),
    };
  }
}
