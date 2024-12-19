import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';
import 'package:whats_app/features/chat/data/repos/chat_repo/chat_repo.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit(this.chatRepo) : super(MessagesInitial());
  final ChatRepo chatRepo;
  Future<void> getMessages(String id) async {
    emit(GetMessagesLoading());
    var result = await chatRepo.getMessages(id);
    result.fold((l) {
      emit(GetMessagesFailure(l.errorMessage));
    }, (r) {
      emit(GetMessagesSuccess(r));
    });
  }
}
