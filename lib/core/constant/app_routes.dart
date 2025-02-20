// app_routes.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/service_locator.dart';
import 'package:whats_app/features/app_layout/presentation/view/app_layout_view.dart';
import 'package:whats_app/features/auth/presentation/views/login_view.dart';
import 'package:whats_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:whats_app/features/chat/data/repos/chat_repo/chat_repo_impl.dart';
import 'package:whats_app/features/chat/presentation/view_model/addMessage_cubit/add_message_cubit.dart';
import 'package:whats_app/features/chat/presentation/view_model/message_cubit/messages_cubit.dart';
import 'package:whats_app/features/chat/presentation/views/chat_view.dart';
import 'package:whats_app/features/groups/data/repos/group_repo_impl.dart';
import 'package:whats_app/features/groups/presentation/view_model/group_cubit/group_cubit.dart';
import 'package:whats_app/features/groups/presentation/views/group_view.dart';
import 'package:whats_app/features/home/presentation/views/bottom_navigation_bar_view.dart';
import 'package:whats_app/features/home/presentation/views/contacts_view.dart';
import 'package:whats_app/features/home/presentation/views/home_view.dart';
import 'package:whats_app/features/profile/presentation/views/profile_view.dart';
import 'package:whats_app/features/search/data/repos/search_repo_impl.dart';
import 'package:whats_app/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:whats_app/features/search/presentation/views/search_view.dart';
import 'package:whats_app/features/splash/presentation/view/splash_view.dart';

class AppRoutes {
  static const login = '/LoginView';
  static const signUp = '/SignView';
  static const home = '/HomeView';
  static const nav = '/BottomNavView';
  static const appLayout = '/';
  static const splash = '/splashView';
  static const group = '/groupView';
  static const search = '/searchView';
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
      group: (context) => BlocProvider(
            create: (context) => GroupCubit(getIt.get<GroupRepoImpl>()),
            child: GroupView(),
          ),
      search: (context) => BlocProvider(
            create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
            child: const SearchView(),
          ),
      profile: (context) => const ProfileView(),
      chat: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => MessagesCubit(getIt.get<ChatRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => AddMessageCubit(getIt.get<ChatRepoImpl>()),
            )
          ], child: const ChatView()),
      contacts: (context) => const ContactsView(),
    };
  }
}
