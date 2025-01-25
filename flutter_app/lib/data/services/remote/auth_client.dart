// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/models/auth_request/auth_request.dart';
import 'package:flutter_app/data/services/models/auth_response/auth_response.dart';

class AuthApiClient {
  AuthApiClient({
    String? host,
    int? port,
    HttpClient Function()? clientFactory,
  })  : _host = host ?? 'localhost',
        _port = port ?? 8080,
        _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;

  Future<Result<AuthResponse>> login(AuthRequest loginRequest) async {
    final client = _clientFactory();
    try {
      final request = await client.post(_host, _port, '/login');
      request.write(jsonEncode(loginRequest));
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        return Result.ok(AuthResponse.fromJson(jsonDecode(stringData)));
      } else {
        return const Result.error(HttpException("Login error"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<AuthResponse>> register(AuthRequest registerRequest) async {
    final client = _clientFactory();
    try {
      final request = await client.post(_host, _port, '/register');
      request.write(jsonEncode(registerRequest));
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        return Result.ok(AuthResponse.fromJson(jsonDecode(stringData)));
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
