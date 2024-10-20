// Just http calls
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/storage_handler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class NetworkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();
  static const String host = 'http://10.0.2.2:5000/';

  static Future<dynamic> post (var body, String endPoint, {bool justBody = false}) async {
    var response = await client.post(
      buildUrl(endPoint), 
      body: body, 
      headers: {"Content-type": "application/json"}
      );
    if (justBody) {
      return jsonDecode(response.body);
    }
    return response;
  }

  static Future<dynamic> get (String endPoint, String? token, {bool justBody = false}) async {
    var response = await client.get(
      buildUrl(endPoint),
      headers: {
        "Content-type": "application/json", 
        "authorization": "Bearer $token"
        }
    );
    if (justBody) {
      return jsonDecode(response.body);
    }
    return response;
  }

   static Future<dynamic> put(var body, String endPoint, String? token, {bool justBody = false}) async {
    var response = await client.put(
      buildUrl(endPoint),
      headers: {
        "Content-Type": "application/json",
        "authorization": "Bearer $token"
        },
      body: body,
    );
    if (justBody) {
      return jsonDecode(response.body);
    }
    return response;
  }

  static Future<dynamic> patch(String endPoint, var body, {bool justBody = false}) async {
    String token = await StorageHandler.getTokenOrLogOut();

    var response = await client.patch(
      buildUrl(endPoint),
      headers: {
        "Content-Type": "application/json",
        "authorization": "Bearer $token"
        },
      body: body,
    );
    if (justBody) {
      return jsonDecode(response.body);
    }
    return response;
  }

  static Future<dynamic> patchImage(String endPoint, String filepath, {bool justBody = false}) async {
    String token = await StorageHandler.getTokenOrLogOut();
    var request = http.MultipartRequest('PATCH', buildUrl(endPoint));
    request.files.add(await http.MultipartFile.fromPath('imageUrl', filepath));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    });
    var responseStream = await request.send();
          // print((await http.Response.fromStream(response)).body);
    var response = await http.Response.fromStream(responseStream);
    if (justBody) {
      return jsonDecode(response.body);
    }
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
    return http.Response('full response', 200);
  }
  
  static Future<List<String>> getUserAccessIdentifiers() async{
    //TODO:
    return [];
  }
}
