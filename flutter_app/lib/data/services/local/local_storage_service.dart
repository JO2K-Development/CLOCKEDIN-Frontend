import 'dart:convert';

import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/employee_brief_model/employee_brief_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

enum AvailableTokens { access, refresh, currentUser, managedUsers }

class LocalDataService {
  LocalDataService({
    FlutterSecureStorage? storage,
  }) : _storage = storage ?? FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  void storeValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<Result<String>> retrieveValue(String key) async {
    var r = await _storage.read(key: key);
    if (r == null) {
      return Result.error(
          Exception("The key: $key wasn't found in the _storage"));
    }
    return Result.ok(r);
  }

  Future<void> discardStored(String key) async {
    await _storage.delete(key: key);
  }

  Future<Result<void>> storeAuthTokens(String access, String refresh) async {
    try {
      await _storage.write(
          key: AvailableTokens.access.toString(), value: access);
      await _storage.write(
          key: AvailableTokens.refresh.toString(), value: refresh);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<void> discardTokens() async {
    await _storage.delete(key: AvailableTokens.access.toString());
    await _storage.delete(key: AvailableTokens.refresh.toString());
  }

  Future<Result<Map<String, String>?>> getTokens() async {
    String? access =
        await _storage.read(key: AvailableTokens.access.toString());
    String? refresh =
        await _storage.read(key: AvailableTokens.refresh.toString());
    if (access == null || refresh == null) {
      return Result.error(Exception("Tokens not found"));
    }
    return Result.ok({
      AvailableTokens.access.toString(): access,
      AvailableTokens.refresh.toString(): refresh
    });
  }

  Future<Result<String>> getAccessToken() async {
    final token = await _storage.read(key: AvailableTokens.access.toString());
    if (token == null) {
      return Result.error(Exception(
          "The key: ${AvailableTokens.access.toString()} wasn't found in the _storage"));
    }
    return Result.ok(token);
  }

  Future<Result<String>> getRefreshToken() async {
    final token = await _storage.read(key: AvailableTokens.refresh.toString());
    if (token == null) {
      return Result.error(Exception(
          "The key: ${AvailableTokens.refresh.toString()} wasn't found in the _storage"));
    }
    return Result.ok(token);
  }

  Future<Result<CurrentUserModel>> getCurrentUser() async {
    try {
      String? data = await _storage.read(
          key: AvailableTokens.currentUser.toString());
      if (data == null) {
        return Result.error(Exception(
            "The key: ${AvailableTokens.currentUser.toString()} wasn't found in the _storage"));
      }
      return Result.ok(CurrentUserModel.fromJson(jsonDecode(data)));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> storeMainUserJson(CurrentUserModel user) async {
    try {
      await _storage.write(
          key: AvailableTokens.currentUser.toString(), value: jsonEncode(user));
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> discardAll() async {
    var tokens = AvailableTokens.values;

    try {
      for (var token in tokens) {
        await discardStored(token.toString());
      }
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<List<EmployeeBriefModel>>> getManagedUsers() async {
    try {
      String? data = await _storage.read(
          key: AvailableTokens.managedUsers.toString());
      if (data == null) {
        return Result.error(Exception(
            "The key: ${AvailableTokens.managedUsers.toString()} wasn't found in the _storage"));
      }
      List<EmployeeBriefModel> managedUsers = [];
      for (var userJson in jsonDecode(data)) {
        managedUsers.add(EmployeeBriefModel.fromJson(userJson));
      }
      return Result.ok(managedUsers);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> storeManagedUsers(List<EmployeeBriefModel> employees) async {
    try {
      List<Map<String, dynamic>> employeesJson = [];
      for (var employee in employees) {
        employeesJson.add(employee.toJson());
      }
      await _storage.write(
          key: AvailableTokens.managedUsers.toString(),
          value: jsonEncode(employeesJson));
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
