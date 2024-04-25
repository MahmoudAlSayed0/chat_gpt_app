import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  bool isUser;
  String content;
  MessageModel({
    required this.isUser,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    String role = isUser ? 'user' : 'assistant';
    return <String, dynamic>{
      'role': role,
      'content': content,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      isUser: map['role'] == 'user',
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
