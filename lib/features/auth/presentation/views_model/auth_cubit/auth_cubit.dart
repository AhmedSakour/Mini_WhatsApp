import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/features/auth/data/models/userModel.dart';
import 'package:whats_app/features/auth/data/repo/auht_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.auhtRepo) : super(AuthInitial());
  final AuhtRepo auhtRepo;
  late UserModel userModel;
  Future<void> login() async {
    var result = await auhtRepo.login(userModel);
    result.fold((f) {
      print(f.toString());
      emit(AuthFailure());
    }, (r) {
      emit(AuthSuccess());
    });
  }

  Future<void> signup() async {
    var result = await auhtRepo.signup(userModel);
    result.fold((f) {
      print(f.toString());
      emit(AuthFailure());
    }, (r) {
      emit(AuthSuccess());
    });
  }
}
