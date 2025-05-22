import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  search(List<UserModel> users, String value) {
    emit(SearchLoading());
    try {
      var result = searchRepo.search(users, value);
      emit(SearchSuccess(users: result));
    } on Exception {
      emit(SearchFailure());
    }
  }
}
