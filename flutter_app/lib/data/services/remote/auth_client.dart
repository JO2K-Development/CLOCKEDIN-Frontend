// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/models/auth_request/auth_request.dart';
import 'package:flutter_app/data/services/models/auth_response/auth_response.dart';
import 'package:flutter_app/data/services/models/register_request/register_request.dart';
import 'package:logger/logger.dart';

class AuthApiClient {
  AuthApiClient({
    String? host,
    int? port,
    // http.Client? client,
  })  : _host = host ?? '10.0.2.2',
        _port = port ?? 8000;

  final String _host;
  final int _port;
  final _log = Logger();

  String get _baseUrl => '$_host:$_port';

  Future<Result<AuthResponse>> login(AuthRequest loginRequest) async {
    var client = http.Client();
    try {
      final uri = Uri.http(_baseUrl, '/auth/token/');
      
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate, br',
        },
        body: jsonEncode(loginRequest),
      );

      if (response.statusCode == 200) {
        final stringData = response.body;
        _log.i(AuthResponse.fromJson(jsonDecode(stringData)).toString());
        return Result.ok(AuthResponse.fromJson(jsonDecode(stringData)));
      } else {
        final stringData = response.body;
        return Result.error(HttpException(stringData));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<int>> register(RegisterRequest registerRequest) async {
    var client = http.Client();
    try {
      final uri = Uri.http(_baseUrl, '/auth/registration/');
      
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(registerRequest),
      );
      if (response.statusCode == 201) {
        return Result.ok(201);
      } else {
        return const Result.error(HttpException("Register error"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
