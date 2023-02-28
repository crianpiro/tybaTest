import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tyba_test/core/entities/dto/result_model.dart';

class ApiBaseSource {
  final String baseUrl;
  final http.Client client;
  final Duration timeout = const Duration(seconds: 30);
  ApiBaseSource(
    this.baseUrl,
    this.client,
  );

  Future<Result<T>> get<T>(String url, T Function(dynamic value) mapperFunction,
      {Map<String, String>? headers}) async {
    try {
      headers = await getHeaders(headers);
      headers[HttpHeaders.contentTypeHeader] = 'application/json';
      headers[HttpHeaders.acceptHeader] = 'application/json';
      log(baseUrl+url, name: 'url');  
      log('GET', name: 'method');
      log(headers.toString(), name: 'headers');
      var response = await client.get(Uri.https(baseUrl,url), headers: headers).timeout(timeout);
      var responseManage = await _manageResponse(response, mapperFunction);
      return responseManage;
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Result<T>.errors({"error":"Error inesperado. Verifica tu conexión a internet."});
    }
  }


  Future<Result<T>> _manageResponse<T>(
      http.Response response, T Function(dynamic value) mapperFunction) async {
    log('MANAGE RESPONSE METHOD');
    log(response.statusCode.toString(), name: 'statusCode');
    log(response.body, name: 'responseBody');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Result<T>.success(mapperFunction(_getBody(response.bodyBytes)));
    } else {
      return _manageError<T>(response);
    }
  }

  Result<T> _manageError<T>(http.Response response) {
    if (response.statusCode >= 500) {
      try {
        return Result<T>.errors({"message":"The server has encountered a situation it does not know how to handle."});
      } catch (ex) {
        log(ex.toString(), name: 'error');
        return Result<T>.errors({"message":"Unexpected error."});
      }
    } else if (response.statusCode == 401) {
        return Result<T>.errors({"message":"Unexpected error"});
    } else {
      return _errorFromMap(response);
    }
  }

  Result<T> _errorFromMap<T>(http.Response response) {
    try {
      Map<String, dynamic> body = jsonDecode(response.body);
      String? description = body['message'];
      description = description ?? "Unexpected error";
      int code = body.containsKey('statusCode') ? int.parse(body['statusCode']) : 0;
      return Result<T>.errors({"message":description,"code":"$code"});
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Result<T>.errors(
          {"message": "Error inesperado. Verifica tu conexión a internet.", "code": "${response.statusCode}"});
    }
  }

  dynamic _getBody(body) {
    if(body!=null){
      var bodyString = utf8.decode(body);
      try {
        return json.decode(bodyString);
      } catch (ex) {
        log(ex.toString(), name: 'error');
        return bodyString;
      }
    }else{
      return {};
    }
  }

  Future<Map<String, String>> getHeaders(Map<String, String>? headers) async {
    headers = headers ?? {};
    return headers;
  }
}