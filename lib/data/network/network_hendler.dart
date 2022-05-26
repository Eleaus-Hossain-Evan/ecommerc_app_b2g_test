import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'api.dart';

class Network {
  static var client = Client();
  static Future<Response> getRequest(
    String endpoint, {
    Map<String, String>? queryParams,
    required Map<String, String> mapHeaders,
    bool noBaseUrl = false,
  }) async {
    Response response;

    if (noBaseUrl) {
      debugPrint("URL : $endpoint");
      response = await client.get(
          Uri.parse(endpoint).replace(queryParameters: queryParams),
          headers: mapHeaders);
    } else {
      debugPrint('URL : ${API.baseUrl}$endpoint');
      response = await client.get(
        Uri.parse('${API.baseUrl}$endpoint'),
        headers: mapHeaders,
      );
    }
    return response;
  }

  static Future handleResponse(Response response) async {
    if (isSuccessful(response.statusCode)) {
      debugPrint('Success: ${response.body}');
      if (response.body.isNotEmpty) {
        return jsonDecode(response.body);
      } else {
        return response.body;
      }
    } else {
      debugPrint("Error : ${response.body}");
      if (response.statusCode != null) {
        debugPrint('Error : ${response.statusCode}');
        return response.statusCode.toString();
      } else {
        return response.statusCode.toString();
      }
    }
  }

  static bool isSuccessful(int code) {
    return code >= 200 && code <= 206;
  }
}
