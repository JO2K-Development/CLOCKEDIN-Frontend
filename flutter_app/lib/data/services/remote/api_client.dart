import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/employee_brief_model/employee_brief_model.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';

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

  Future<Result<CurrentUserModel>> getUser(int id) async {
    final client = _clientFactory();
    try{
      final request = await client.get(_host, _port, '/user/$id');
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(CurrentUserModel.fromJson(json));
      } else {
        return Result.error(HttpException(response.reasonPhrase));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  Future<Result<CurrentUserModel>> getCurrentUser() async {
    final client = _clientFactory();
    try{
      final request = await client.get(_host, _port, '/user');
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(CurrentUserModel.fromJson(json));
      } else {
        return Result.error(HttpException(response.reasonPhrase));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  Future<Result<StatisticsModel>> getStatisticsForUser(int id) async {
    final client = _clientFactory();
    try{
      final request = await client.get(_host, _port, '/statistics/$id');
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(StatisticsModel.fromJson(json));
      } else {
        return Result.error(HttpException(response.reasonPhrase));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  Future<Result<List<WorkCycleModel>>> getWorkCyclesForUser(int userId) {
    //TODO: implement getWorkCyclesForUser with db
    return Future.value(Result.error(Exception("Not impl")));
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
}