import 'package:bloc/bloc.dart';
import 'package:whats_app/features/home/data/models/chat_model.dart';
import 'package:whats_app/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  Future<void> getChats() async {
    emit(GetChatsLoading());
    var result = await homeRepo.getChats();
    result.fold((l) {
      emit(GetChatsFailure(l.errorMessage));
    }, (r) {
      emit(GetChatsSuccess(r));
    });
  }
}
