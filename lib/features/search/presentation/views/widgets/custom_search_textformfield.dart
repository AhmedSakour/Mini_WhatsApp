import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/search/presentation/view_model/search_cubit/search_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({
    super.key,
    required this.users,
  });
  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: true,
        focusNode: focusNode,
        controller: searchController,
        onFieldSubmitted: (value) async {
          await BlocProvider.of<SearchCubit>(context).search(users, value);
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: 'search',
          hintStyle:
              AppStyles.styleRegular20(context).copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
