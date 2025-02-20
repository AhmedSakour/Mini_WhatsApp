import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whats_app/features/groups/data/models/group_model.dart';
import 'package:whats_app/features/groups/data/repos/group_repo.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  GroupCubit(this.groupRepo, {this.groupModel}) : super(GroupInitial());
  final GroupRepo groupRepo;
  GroupModel? groupModel;
  setGroupModel(GroupModel groupModel) {
    this.groupModel = groupModel;
    emit(UpdateGroupModel());
  }

  checkUsers() {
    var result = groupModel?.users ?? [];
    return result.isEmpty;
  }

  Future<void> createGroup() async {
    emit(CreateGroupLoading());
    if (checkUsers()) {
      emit(CreateGroupFailure('pleas select one user at lest'));
    } else {
      if (groupModel != null) {
        var result = await groupRepo.createGroup(groupModel!);
        result.fold(
          (l) {
            emit(CreateGroupFailure(l.toString()));
          },
          (r) {
            emit(CreateGroupSuccess());
          },
        );
      } else {
        emit(CreateGroupFailure('failed ,please try again'));
      }
    }
  }
}
