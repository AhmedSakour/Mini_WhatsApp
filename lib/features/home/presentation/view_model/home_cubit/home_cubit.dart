import 'package:bloc/bloc.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  Future<void> getUsers(List<UserModel> users) async {
    emit(GetUsersLoading());
    var result = await homeRepo.getUsers(users);
    result.fold((l) {
      emit(GetUsersFailure(l.errorMessage));
    }, (r) {
      emit(GetUsersSuccess(r));
    });
  }
}
