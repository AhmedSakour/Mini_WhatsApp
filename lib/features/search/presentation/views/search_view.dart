import 'package:flutter/material.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<UserModel> data =
        ModalRoute.of(context)!.settings.arguments as List<UserModel>;
    return Scaffold(
      body: SafeArea(
        child: SearchViewBody(
          users: data,
        ),
      ),
    );
  }
}
