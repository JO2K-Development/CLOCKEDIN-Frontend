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
    StatisticsModel sM = StatisticsModel.fromJson({"result" : [
        {"simple" : {
          "name": "Statisctic one",
          "value": 234}},
        {"plot": {
          "title": "Example plot",
          "x_label": "Time",
          "y_label": "Value",
          "data": {
            "Jan": 35,
            "Feb": 28,
            "Mar": 34,
            "Apr": 32,
            "May": 40,
            "Jun": 33,
            "Jul": 25,
            "Aug": 28,
            "Sep": 30,
            "Oct": 35,
            "Nov": 38,
            "Dec": 32,
          }
        }
  }]});
    return Result.ok(sM);

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
    dummyWorkCycles()  {
    //TODO: implement getWorkCycles
    // they should be sorted and be like a short list of some
    return [
      WorkCycleModel(
          id: 6,
          startTime: DateTime.now().add(Duration(days: 1)),
          endTime: DateTime.now().add(Duration(days: 1, hours: 8)),
          type: WorkCycleType.remoteWork),
      WorkCycleModel(
          id: 7,
          startTime: DateTime.now().subtract(Duration(days: 1)),
          endTime: DateTime.now().add(Duration(days: 12, hours: -8)),
          type: WorkCycleType.approvedByLocation),
      WorkCycleModel(
          id: 8,
          startTime: DateTime.now().subtract(Duration(days: 10)),
          endTime: DateTime.now().subtract(Duration(days: 10, hours: -8)),
          type: WorkCycleType.approvedByManager),
      WorkCycleModel(
          id: 9,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
      WorkCycleModel(
          id: 10,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
      WorkCycleModel(
          id: 11,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),

      WorkCycleModel(
          id: 12,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
      WorkCycleModel(
          id: 13,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
    ];
  } 
    return Future.value(Result.ok(dummyWorkCycles()));
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