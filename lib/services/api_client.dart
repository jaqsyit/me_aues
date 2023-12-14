import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/urls.dart';
import 'storage_helper.dart';

class ApiClient {
  String sid = '';
  String cookies = '';
  ApiClient();
  Future<http.Response> get(
    String url, {
    Map<String, String>? parameters,
    bool withToken = true,
  }) async {
    final storage = StorageManager();
    String? accessToken;
    if (withToken) {
      accessToken = await storage.getAccessToken();
      sid = (await storage.getSid())!;
      cookies = (await storage.getCookies())!;
    }
    try {
      final response = await http.get(
        Uri.https(baseUrl, url, parameters),
        headers: _buildHeaders(withToken, accessToken),
      );
      print(response.body);
      return response;
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<http.Response> post(
    String url, {
    Map<String, String>? parameters,
    bool withToken = true,
    Map<String, dynamic>? body,
    Object? jsonBody,
  }) async {
    final storage = StorageManager();
    String? accessToken;
    if (withToken) {
      accessToken = await storage.getAccessToken();
      sid = (await storage.getSid())!;
      cookies = (await storage.getCookies())!;
    }
    try {
      String bodyString =
          jsonBody != null ? jsonEncode(jsonBody) : jsonEncode(body);
      final response = await http.post(
        Uri.https(baseUrl, url, parameters),
        headers: _buildHeaders(withToken, accessToken),
        body: bodyString,
      );
      return response;
    } catch (e) {
      print(e);
      return _handleError(e);
    }
  }

  Future<http.Response> put(
    String url, {
    Map<String, String>? parameters,
    bool withToken = true,
    Map<String, dynamic>? body,
    Object? jsonBody,
  }) async {
    final storage = StorageManager();
    String? accessToken;
    String requestURL = parameters != null ? '$url/${parameters['id']}' : url;
    if (withToken) {
      accessToken = await storage.getAccessToken();
      sid = (await storage.getSid())!;
      cookies = (await storage.getCookies())!;
    }
    try {
      String bodyString =
          jsonBody != null ? jsonEncode(jsonBody) : jsonEncode(body);
      final response = await http.post(
        Uri.https(baseUrl, requestURL, parameters),
        headers: _buildHeaders(withToken, accessToken),
        body: bodyString,
      );

      return response;
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<http.Response> delete(
    String url, {
    Map<String, String>? parameters,
    bool withToken = true,
  }) async {
    final storage = StorageManager();
    String requestURL = parameters != null ? '$url/${parameters['id']}' : url;
    String? accessToken;
    if (withToken) {
      accessToken = await storage.getAccessToken();
      sid = (await storage.getSid())!;
      cookies = (await storage.getCookies())!;
    }
    try {
      final response = await http.delete(
        Uri.https(baseUrl, requestURL, parameters),
        headers: _buildHeaders(withToken, accessToken),
      );

      return response;
    } catch (e) {
      return _handleError(e);
    }
  }

  Map<String, String> _buildHeaders(bool withToken, String? accessToken) {
    var headers = {
      'Accept': 'application/json, text/javascript, */*; q=0.01',
      'Accept-Language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,kk;q=0.6',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json; charset=UTF-8',
      'DNT': '1',
      'Origin': baseUrl,
      'Referer': '$baseUrl/index',
      'Sec-Fetch-Dest': 'empty',
      'Sec-Fetch-Mode': 'cors',
      'Sec-Fetch-Site': 'same-origin',
      // 'User-Agent': 'Your User Agent', // Опционально, если требуется
      'X-Requested-With': 'XMLHttpRequest',
      'language': '1',
      'sec-ch-ua':
          '"Google Chrome";v="119", "Chromium";v="119", "Not?A_Brand";v="24"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': "Windows"
    };

    if (withToken && accessToken != null) {
      headers['token'] = accessToken;
      if (sid != '') {
        headers['sid'] = sid;
      }
      if (cookies != '') {
        headers['Cookie'] = cookies;
      }
    }

    return headers;
  }

  http.Response _handleError(dynamic e) {
    if (e is SocketException) {
      return _createErrorResponse('Проверьте интернет подключение');
    } else if (e is TimeoutException) {
      return _createErrorResponse('Долгая загрузка');
    } else {
      return _createErrorResponse('Неизвестная ошибка');
    }
  }

  http.Response _createErrorResponse(String message) {
    final errorResponse = {
      'message': message,
    };
    return http.Response(jsonEncode(errorResponse), 500);
  }
}
