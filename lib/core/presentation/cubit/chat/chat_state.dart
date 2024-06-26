// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'chat_cubit.dart';

class ChatState extends Equatable {
  const ChatState(
      {this.requestState = RequestState.init,
      this.messages = const {'new': []},
      this.errorMessage = '',
      this.idList = const [],
      this.fetchingData = false,
      this.recentChats = const []});

  final RequestState requestState;
  final Map<String?, List<MessageModel>> messages;
  final String errorMessage;
  final List<String> idList;
  final List<Map<String, List<MessageModel>>> recentChats;
  final bool fetchingData;

  @override
  List<Object> get props {
    return [
      requestState,
      messages,
      errorMessage,
      idList,
      recentChats,
      fetchingData,
    ];
  }

  ChatState copyWith({
    RequestState? requestState,
    Map<String?, List<MessageModel>>? messages,
    String? errorMessage,
    List<String>? idList,
    List<Map<String, List<MessageModel>>>? recentChats,
    bool? fetchingData,
  }) {
    return ChatState(
      requestState: requestState ?? this.requestState,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
      idList: idList ?? this.idList,
      recentChats: recentChats ?? this.recentChats,
      fetchingData: fetchingData ?? this.fetchingData,
    );
  }
}
