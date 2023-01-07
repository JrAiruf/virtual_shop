// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

abstract class ClientService {
  Future<Response> get(String path);
  Future<Response> post({String path, Map<String, dynamic> body, headers});
  Future<Response> put(String path);
  Future<Response> delete(String path);
}

class DioService implements ClientService {
  DioService({required this.dio});
  final Dio dio;
  @override
  Future<Response> get(String path) async {
        return dio.get(path);
  }

  @override
  Future<Response> delete(String path) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response> post(
      {String path = '',
      Map<String, dynamic> body = const {},
      headers = const {}}) async {
    final bodyJson = jsonEncode(body);
    final result = await Dio()
        .post(path, options: Options(headers: headers), data: bodyJson);
    if (result.statusCode == 200) {
      return result.data;
    }
    throw Exception();
  }

  @override
  Future<Response> put(String path) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
