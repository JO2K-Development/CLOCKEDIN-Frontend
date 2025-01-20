import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';

/// Adds the `Authentication` header to a header configuration.
typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({
    String? host,
    int? port,
    HttpClient Function()? clientFactory,
  })  : _host = host ?? 'localhost/api',
        _port = port ?? 8000,
        _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;

  AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }
  //TODO: NIE ROZUMIEM
  Future<void> _authHeader(HttpHeaders headers) async {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers.add(HttpHeaders.authorizationHeader, header);
    }
  }

  Future<Result<UserApiModel>> getUser(int id) async {
    final client = _clientFactory();
    try{
      final request = await client.get(_host, _port, '/user/$id');
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(UserApiModel.fromJson(json));
      } else {
        return Result.error(HttpException(response.reasonPhrase));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  Future<Result<UserApiModel>> getCurrentUser() async {
    final client = _clientFactory();
    try{
      final request = await client.get(_host, _port, '/user');
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(UserApiModel.fromJson(json));
      } else {
        return Result.error(HttpException(response.reasonPhrase));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

}