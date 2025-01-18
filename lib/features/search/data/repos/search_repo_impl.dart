import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  List<UserModel> search(List<UserModel> users, String value) {
    try {
      return users.where((user) => user.name.contains(value)).toList();
    } on Exception {
      return [];
    }
  }
}
