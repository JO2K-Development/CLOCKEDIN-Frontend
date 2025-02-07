import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/core/utils/dev/exceptions/not_implemented_resutl.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/domain/model_classes/company_invitation_model/company_invitation_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/employee_brief_model/employee_brief_model.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';
import 'package:logger/logger.dart';

class ApiClient {
  ApiClient({
    String? host,
    int? port,
  })  : _host = host ?? '10.0.2.2',
        _port = port ?? 8000;

  final String _host;
  final int _port;
  final dynamic storage = FlutterSecureStorage();
  String? _cachedBearer; 
  Map<String,String>? _cachedAuthHeaders;

  final _log = Logger();

  String get _baseUrl => '$_host:$_port';
  Future<String> get bearer async {
    return _cachedBearer ??= 'Bearer ${await storage.read(key: AvailableTokens.access.toString())}';
  }

  Future<Map<String,String>> get authHeaders async {
    return _cachedAuthHeaders ??= {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate, br',
          'Authorization': await bearer,
        };
  }


  Future<Result<CurrentUserModel>> getUser(int id) async {
    final client = http.Client();
    try{
      final uri = Uri.http(_baseUrl, 'api/user/$id');
      
      final response = await client.get(
        uri,
        headers: await authHeaders
      );
      if (response.statusCode == 200) {
        final stringData = response.body;
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(CurrentUserModel.fromJson(json));
      } else {
        return Result.error(HttpException(response.body));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  Future<Result<CurrentUserModel>> getCurrentUser() async {
    final client = http.Client();
    try{
      final uri = Uri.http(_baseUrl, 'api/user/user/');
      _log.i("Getting current user headers: ${await authHeaders}, uri: $uri");
      final response = await client.get(
        uri,
        headers: await authHeaders
      );
      if (response.statusCode == 200) {
        final stringData = response.body;
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        _log.i("Current user response: $json");
        _log.i("which in model is ${CurrentUserModel.fromJson(json)}");
        return Result.ok(CurrentUserModel.fromJson(json));
      } else {
        _log.f("Error: ${response.body}");
        return Result.error(HttpException(response.body));
      }
    } on Exception catch (e) {
      _log.f(e);
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  Future<Result<StatisticsModel>> getStatisticsForUser(int id) async {
    final client = http.Client();
    try{
      final uri = Uri.http(_baseUrl, 'api/statistics/$id');
      final response = await client.get(
        uri,
        headers: await authHeaders
      );
      if (response.statusCode == 200) {
        final stringData = response.body;
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(StatisticsModel.fromJson(json));
      } else {
        return Result.error(HttpException(response.body));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  Future<Result<List<WorkCycleModel>>> getWorkCyclesForUser(int userId) {
    //TODO: implement getWorkCyclesForUser with db
    return NotImplementedFutureResult.raise();
  }

  Future<Result<List<EmployeeBriefModel>>> getManagedUsers(int userId) {
    dummyManagedUsers() {
      return [
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${90234234901}", additionalInfo: '', managerId: null),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maroo", lastName: "Frankfurt", profilePictureUrl: "https://picsum.photos/200", additionalInfo: '', managerId: null),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Senior Chad", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${3}", additionalInfo: "Here u can send info like 'is at work' or 'to be fired' etc.", managerId: null),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Senior Chad", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${4}", additionalInfo: '', managerId: null),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${5}", additionalInfo: "At work or whatever", managerId: null),
      
      EmployeeBriefModel(id: 123, companyId: 21, position: "Senior Chad", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${3}", additionalInfo: "Here u can send info like 'is at work' or 'to be fired' etc.", managerId: null),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Senior Chad", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${4}", additionalInfo: '', managerId: null),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${5}", additionalInfo: "At work or whatever", managerId: null),
    ]..sort((a, b) => a.firstName.compareTo(b.position!));
    }
    return Future.value(Result.ok(dummyManagedUsers()));
  }

  Future<Result<void>> updateCurrentUser(CurrentUserModel user) async {
    final client = http.Client();
    try{
      final uri = Uri.http(_baseUrl, 'api/user/user/');
      
      _log.i("Updating user");
      _log.i("headers: ${await authHeaders}, uri: $uri, body: ${jsonEncode(user.toJson())}");
      final response = await client.patch(
        uri,
        headers: await authHeaders,
        body: jsonEncode(user.toJson())
      );
      if (response.statusCode == 200) {
        _log.i("User updated with response: ${response.body}");
        return Result.ok(null);
      } else {
        return Result.error(HttpException(response.body));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  Future<Result<List<CompanyInvitationModel>>> getCurrentUserCompanyInvitations() async {
    try {
      final client = http.Client();
      final uri = Uri.http(_baseUrl, 'api/user/invitations/');
      final response = await client.get(
        uri,
        headers: await authHeaders
      );
      if (response.statusCode == 200) {
        final stringData = response.body;
        final json = jsonDecode(stringData) as List<dynamic>;
        return Result.ok(json.map((e) => CompanyInvitationModel.fromJson(e as Map<String, dynamic>)).toList());
      } else {
        return Result.error(HttpException(response.body));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}