import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whats_app/core/constant/app_routes.dart';
import 'package:whats_app/core/constant/hive_boxes.dart';
import 'package:whats_app/core/functions/bloc_observer.dart';
import 'package:whats_app/core/functions/service_locator.dart';
import 'package:whats_app/core/themes/app_theme.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/home/data/repos/home_repo_impl.dart';
import 'package:whats_app/features/home/presentation/view_model/contact_cubit/contact_cubit.dart';
import 'package:whats_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(kUserInfo);
  Bloc.observer = MyBlocObserver();
  setup();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HomeCubit(getIt.get<HomeRepoImpl>())..getChats()),
        BlocProvider(
            create: (context) =>
                ContactCubit(getIt.get<HomeRepoImpl>())..getUsers([])),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: AppTheme.lightTheme(context),
        routes: AppRoutes.getRoutes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
