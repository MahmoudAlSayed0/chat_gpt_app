// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'chat_cubit.dart';

class ChatState extends Equatable {
  const ChatState(
      {this.requestState = RequestState.init,
      this.messages = const [],
      this.errorMessage = ''});

  final RequestState requestState;
  final List<MessageModel> messages;
  final String errorMessage;

  @override
  List<Object> get props => [requestState, messages, errorMessage];

  ChatState copyWith({
    RequestState? requestState,
    List<MessageModel>? messages,
    String? errorMessage,
  }) {
    return ChatState(
      requestState: requestState ?? this.requestState,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
