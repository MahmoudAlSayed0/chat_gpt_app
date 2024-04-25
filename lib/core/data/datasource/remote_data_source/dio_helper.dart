import 'dart:developer';

import 'package:chat_gpt_app/core/data/datasource/remote_data_source/app_interceptor.dart';
import 'package:chat_gpt_app/core/data/datasource/remote_data_source/error/exceptions.dart';
import 'package:chat_gpt_app/core/data/datasource/remote_data_source/error/status_code.dart';

import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio dio = Dio();

  factory RemoteDataSource() {
    _instance.dio.interceptors.add(AppInterceptor());
    return _instance;
  }
  RemoteDataSource._internal();
  static final RemoteDataSource _instance = RemoteDataSource._internal();

  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        endPoint,
        queryParameters: query,
      );
      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  Future<Response> post(String endPoint,
      {Map<String, dynamic>? query, Object? body}) async {
    try {
      final response = await dio.post(
        endPoint,
        queryParameters: query,
        data: body,
      );
      log(response.toString());
      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  Future<Response> put(
    String endPoint, {
    Map<String, dynamic>? query,
    Object? body,
  }) async {
    try {
      final response = await dio.put(
        endPoint,
        queryParameters: query,
        data: body,
      );

      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  Future<Response> delete(String endPoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.delete(
        endPoint,
        queryParameters: query,
        data: body,
      );

      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  Future<Response> patch(String endPoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.patch(
        endPoint,
        queryParameters: query,
        data: body,
      );

      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();

      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internetServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        throw const CancelRequestException();
      case DioExceptionType.unknown:
        throw const UnknownException();
      case DioExceptionType.badCertificate:
        throw const BadCertificateException();
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
    }
  }
}
