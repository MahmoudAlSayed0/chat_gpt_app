import 'dart:io';

import 'package:chat_gpt_app/app/config.dart';
import 'package:chat_gpt_app/core/data/datasource/remote_data_source/error/status_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'end_point.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    options
      ..baseUrl = EndPoint.baseUrl
      ..responseType = ResponseType.json
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internetServerError;
      }
      ..headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${AppConfig.key}'
      };
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
