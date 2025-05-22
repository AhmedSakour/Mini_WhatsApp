import 'package:whats_app/features/auth/data/models/user_model.dart';

abstract class SearchRepo {
  List<UserModel> search(List<UserModel> users, String value);
}
