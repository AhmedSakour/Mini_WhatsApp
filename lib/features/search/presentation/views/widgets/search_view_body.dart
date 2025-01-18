import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/home/presentation/views/widgets/contacts_list_view.dart';
import 'package:whats_app/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:whats_app/features/search/presentation/views/widgets/custom_search_textformfield.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.users});
  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchTextField(
          users: users,
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchSuccess) {
              return Expanded(
                child: ContactsListView(
                  users: state.users,
                ),
              );
            } else if (state is SearchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
