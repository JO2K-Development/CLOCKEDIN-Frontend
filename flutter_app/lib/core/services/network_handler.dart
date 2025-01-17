// Just http calls
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/storage_handler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
//TODO: HANDLE TOKEN EXPIRED
//TODO: HANDLE TOKEN EXPIRED
//TODO: HANDLE TOKEN EXPIRED

class NetworkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();
  static const String host = 'http://10.0.2.2:8000/';

  static Future<http.Response> post (var body, String endPoint) async {
    var response = await client.post(
      buildUrl(endPoint), 
      body: body, 
      headers: {"Content-type": "application/json"}
      );
    return response;
  }

  static Future<http.Response> get (String endPoint, String? token) async {
    var response = await client.get(
      buildUrl(endPoint),
      headers: {
        "Content-type": "application/json", 
        "authorization": "Bearer $token"
        }
    );
    return response;
  }

   static Future<http.Response> put (var body, String endPoint, String? token) async {
    var response = await client.put(
      buildUrl(endPoint),
      headers: {
        "Content-Type": "application/json",
        "authorization": "Bearer $token"
        },
      body: body,
    );
    return response;
  }

  static Future<http.Response> patch(var body, String endPoint) async {
    String token = await StorageHandler.getAccessTokenOrLogOut();

    var response = await client.patch(
      buildUrl(endPoint),
      headers: {
        "Content-Type": "application/json",
        "authorization": "Bearer $token"
        },
      body: body,
    );
    return response;
  }

  static Future<http.Response> patchImage(String filepath, String endPoint) async {
    String token = await StorageHandler.getAccessTokenOrLogOut();
    var request = http.MultipartRequest('PATCH', buildUrl(endPoint));
    request.files.add(await http.MultipartFile.fromPath('imageUrl', filepath));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    });
    var responseStream = await request.send();
          // print((await http.Response.fromStream(response)).body);
    var response = await http.Response.fromStream(responseStream);
    return response;
  }

  static Uri buildUrl(String endPoint) {
    final apiPath = host + endPoint;
    return Uri.parse(apiPath);
  }

  
  // static Future<void> switchLinkage(String observatorId, String observedId) async {
  //   var response = await NetworkHandler.patch(
  //             'links_between_users/switch_link',
  //             jsonEncode({ 
  //               'observatorId': observatorId, 
  //               'observedId': observedId
  //             }));
  //           print( response.body);
  // }

  static NetworkImage getImage(String specifier) {
    return NetworkImage('${host}uploads/$specifier.jpg');
  }

  static NetworkImage getImageAt(String specifier) {
    return NetworkImage('$host$specifier');
  }

  static Future<http.Response> getMainUser() async {
    //TODO:
    String exampleJson = '''
  {
    "id": 1,
    "company_id": 123,
    "position": "Developer",
    "first_name": "John",
    "last_name": "Doe",
    "email": "john.doe@example.com",
    "manager_id": 456,
    "profile_picture_url": "https://picsum.photos/200",
    "access_identifiers": ["employee"]
  }
  ''';
    return http.Response(exampleJson, 200);
  }
  
  static Future<List<String>> getUserAccessIdentifiers() async {
    //TODO:
    return [];
  }

  static Future<http.Response> postUserLogin(String email, String password) async {
    http.Response response = await NetworkHandler.post(
      jsonEncode({
      'email': email,
      'password': password
      }),
      'api/auth/token/'
    );
    return response;
    }
  
}
