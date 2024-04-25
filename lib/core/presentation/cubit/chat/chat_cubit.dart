import 'dart:developer';

import 'package:chat_gpt_app/core/data/models/message_model.dart';
import 'package:chat_gpt_app/core/data/models/request_state.dart';
import 'package:chat_gpt_app/core/domain/app_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState()) {
    getChats();
  }
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

  clearAndSave() async {
    if (state.messages.isNotEmpty) {
      if (!state.recentChats.any((element) => element == state.messages)) {
        await repo.saveChat(state.messages);
        await getChats();
      }
    }
  }

  getChats() async {
    emit(state.copyWith(idList: await repo.getIDs()));

    if (state.idList.isNotEmpty) {
      List<List<MessageModel>> chatList = [];
      for (var id in state.idList) {
        chatList.add(await repo.getChat(id));
      }
      emit(state.copyWith(recentChats: chatList, messages: []));
      log(chatList.toString());
      log(chatList.last.first.content);
    }
  }

  setAsCurrentChat(List<MessageModel> chat) {
    emit(state.copyWith(messages: chat));
  }

  deleteChats() async {
    await repo.clearConversations();
    emit(state.copyWith(recentChats: [], messages: []));
  }
}
