import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/home/data/repos/home_repo.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit(this.homeRepo) : super(ContactInitial());
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
