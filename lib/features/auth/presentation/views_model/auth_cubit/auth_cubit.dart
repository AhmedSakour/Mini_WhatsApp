import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/auth/data/repo/auht_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.auhtRepo,
  ) : super(AuthInitial());
  final AuhtRepo auhtRepo;
  UserModel? userModel;

  Future<void> login() async {
    var result = await auhtRepo.login(userModel!);
    result.fold((f) {
      emit(AuthFailure(f.errorMessage));
    }, (r) {
      emit(AuthSuccess());
    });
  }

  Future<void> signup() async {
    var result = await auhtRepo.signup(userModel);
    result.fold((f) {
      emit(AuthFailure(f.errorMessage));
    }, (r) {
      emit(AuthSuccess());
    });
  }

  Future<void> addUserToUserCollection() async {
    var result = await auhtRepo.addUserToUserCollection(userModel);
    result.fold((f) {
      emit(AddUserToUserCollectionFailure(f.errorMessage));
    }, (r) {
      emit(AddUserToUserCollectionSuccess());
    });
  }
}
