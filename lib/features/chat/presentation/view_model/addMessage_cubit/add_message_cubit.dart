import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';
import 'package:whats_app/features/chat/data/repos/chat_repo/chat_repo.dart';

part 'add_message_state.dart';

class AddMessageCubit extends Cubit<AddMessageState> {
  AddMessageCubit(this.chatRepo) : super(AddMessageInitial());
  final ChatRepo chatRepo;
  Future<void> addMessage(MessageModel message, UserModel userModel) async {
    var result = await chatRepo.addMessage(message, userModel);
    result.fold((l) {
      emit(AddMessageFailure());
    }, (r) {
      emit(AddMessageSuccess());
    });
  }
}
