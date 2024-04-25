import 'dart:convert';
import 'dart:developer';

import 'package:chat_gpt_app/core/data/datasource/local_data_source/hiver.dart';
import 'package:chat_gpt_app/core/data/datasource/remote_data_source/dio_helper.dart';
import 'package:chat_gpt_app/core/data/datasource/remote_data_source/end_point.dart';
import 'package:chat_gpt_app/core/data/datasource/remote_data_source/error/failure.dart';
import 'package:chat_gpt_app/core/data/models/message_model.dart';
import 'package:dartz/dartz.dart';

class AppRepository {
  AppRepository._internal();
  static final AppRepository _instance = AppRepository._internal();
  factory AppRepository() => _instance;
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<Either<Failure, MessageModel>> sendMessage(
      {List<MessageModel> messages = const []}) async {
    log(messages.toString());
    try {
      final response = await _remoteDataSource.post(EndPoint.baseUrl,
          body: json.encode({
            "model": "gpt-3.5-turbo",
            "messages": messages.map((e) => e.toMap()).toList()
          }));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        Map<String, dynamic> messageObj = data['choices'][0]['message'];

        return Right(MessageModel.fromMap(messageObj));
      }
      return Left(
        ServerFailure(data: response.data, message: response.statusMessage),
      );
    } catch (e) {
      log('Repository Exception Error: $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<void> saveChat(List<MessageModel> messages) async {
    String data =
        json.encode({"messages": messages.map((e) => e.toMap()).toList()});
    log('saving$data');
    await LocalDataSource.saveChat(
        DateTime.now().millisecondsSinceEpoch.toString(), data);
  }

  Future<List<MessageModel>> getChat(String id) async {
    String? jsonData = await LocalDataSource.getChat(id);
    if (jsonData == null) return [];
    Map<String, dynamic> data = json.decode(jsonData);
    List list = data['messages'];
    List<MessageModel> msgList =
        list.map((e) => MessageModel.fromMap(e)).toList();
    return msgList;
  }

  Future<List<String>> getIDs() async {
    return LocalDataSource.getIDs();
  }

  Future clearConversations() async {
    await LocalDataSource.clearCache();
  }

  Future deleteChat(String id) async {
    await LocalDataSource.deleteChat(id);
  }
}
