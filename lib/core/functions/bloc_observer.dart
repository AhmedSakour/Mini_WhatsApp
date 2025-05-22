import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(change.toString());
  }
}
