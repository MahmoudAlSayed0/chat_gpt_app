import 'package:chat_gpt_app/core/data/models/message_model.dart';
import 'package:chat_gpt_app/core/data/models/request_state.dart';
import 'package:chat_gpt_app/core/domain/app_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());
  AppRepository repo = AppRepository();

  static ChatCubit get(context) => BlocProvider.of(context);

  sendMessage(String text) async {
    MessageModel message = MessageModel(isUser: true, content: text);

    emit(state.copyWith(
        requestState: RequestState.loading,
        messages: [...state.messages, message]));
    final res = await repo.sendMessage(messages: [...state.messages, message]);
    res.fold((l) {
      emit(state.copyWith(
          requestState: RequestState.error, errorMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          requestState: RequestState.success,
          messages: [...state.messages, r]));
    });
  }
}
