import 'package:get_it/get_it.dart';
import 'package:whats_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:whats_app/features/chat/data/repos/chat_repo/chat_repo_impl.dart';
import 'package:whats_app/features/groups/data/repos/group_repo_impl.dart';
import 'package:whats_app/features/home/data/repos/home_repo_impl.dart';
import 'package:whats_app/features/search/data/repos/search_repo_impl.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  getIt.registerSingleton<ChatRepoImpl>(ChatRepoImpl());
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
  getIt.registerSingleton<GroupRepoImpl>(GroupRepoImpl());
}
