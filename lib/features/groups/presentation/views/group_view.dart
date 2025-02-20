import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/constant/app_routes.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/core/themes/colors.dart';
import 'package:whats_app/features/groups/presentation/view_model/group_cubit/group_cubit.dart';
import 'package:whats_app/features/groups/presentation/views/widgest/custom_appbar_group.dart';
import 'package:whats_app/features/groups/presentation/views/widgest/group_view_body.dart';

class GroupView extends StatelessWidget {
  GroupView({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var groupCubit = BlocProvider.of<GroupCubit>(context);
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: CustomAppbarGroup(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              await groupCubit.createGroup();
            }
          },
        ),
        body: BlocListener<GroupCubit, GroupState>(
          listener: (context, state) {
            if (state is CreateGroupSuccess) {
              Navigator.pushNamed(context, AppRoutes.nav);
            }
            if (state is CreateGroupFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                state.errorMessage,
                style: AppStyles.styleRegular16(context),
              )));
              Navigator.of(
                context,
              ).pop();
            }
            if (state is CreateGroupLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Center(
                      child: Text(
                        'please wait...',
                        style: AppStyles.styleBold24(context),
                      ),
                    ),
                    content: SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
          child: const GroupViewBody(),
        ),
      ),
    );
  }
}
