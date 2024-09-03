import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../errors/exceptions.dart';

class APIManager {
  static final APIManager _instance = APIManager.internal();

  APIManager.internal();

  factory APIManager() => _instance;

  Dio dio = Dio()..options.validateStatus = (status) => true;

  late Response response;

  Future getData({String? url, Map? headers}) async {
    dio.options.baseUrl = "https://api.themoviedb.org/3/";
    try {
      response = await dio.get(url!,
          queryParameters: {"api_key": "d3ff61934a580c2e1d5f181fc626c662"});
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw NoInternetException();
      } else if (e.error is TimeoutException) {
        throw TimeoutServerException();
      }
      if (e.response != null) {
        response = e.response!;
      }
    } on TimeoutException {
      throw TimeoutServerException();
    }
    return handleResponse(response, url!);
  }

  dynamic handleResponse(Response response, String url) {
    final data = response.data;
    final int statusCode = response.statusCode ?? 0;
    if (statusCode == 202) {
      SnackBar(
        content: Text(
          data['message'],
        ),
      );
    } else if (statusCode >= 400 && statusCode < 500) {
      if (response.statusCode == 404) {
        throw ServerException(statusCode: statusCode);
      } else if (!data.toString().contains('<!DOCTYPE html>') &&
          data?['message'] != null) {
        SnackBar(
          content: Text(
            data['message'],
          ),
        );
      }
      throw ServerException(statusCode: statusCode, message: data['message']);
    }
    return response;
  }
}
