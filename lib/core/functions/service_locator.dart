import 'package:get_it/get_it.dart';
import 'package:whats_app/features/auth/data/repo/auth_repo_impl.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
}
