import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIServiceClient {
  static Future<Map<String, String>> _getHeader() async {
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json"
    };
  }

  static Future<Map<String, dynamic>> post(
      {required String uri, required Map<String, dynamic> params}) async {
    try {
      final client = http.Client();
      Map<String, String> headers = await _getHeader();
      Future.delayed(const Duration(seconds: 30))
          .whenComplete(() => client.close());

      http.Response response = await client.post(Uri.parse(uri),
          headers: headers, body: jsonEncode(params));

      Map<String, dynamic> result =
          json.decode(utf8.decode(response.bodyBytes));

      return result;
    } catch (e) {
      debugPrint("[API] Post failed: $e");
      throw Exception();
    }
  }

  static Future<Map<String, dynamic>> get({required String uri}) async {
    try {
      final client = http.Client();

      Map<String, String> headers = await _getHeader();

      Future.delayed(const Duration(seconds: 30))
          .whenComplete(() => client.close());

      http.Response response =
          await client.get(Uri.parse(uri), headers: headers);

      Map<String, dynamic> result =
          json.decode(utf8.decode(response.bodyBytes));
      return result;
    } catch (e) {
      debugPrint("[API] Get failed: $e");
      throw Exception();
    }
  }

  static Future<Map<String, dynamic>> delete({required String uri}) async {
    try {
      final client = http.Client();
      Map<String, String> headers = await _getHeader();

      /// Force close after defined waiting time
      Future.delayed(const Duration(seconds: 30))
          .whenComplete(() => client.close());

      http.Response response =
          await client.delete(Uri.parse(uri), headers: headers);

      Map<String, dynamic> result =
          json.decode(utf8.decode(response.bodyBytes));
      return result;
    } catch (e) {
      debugPrint("[API] Delete failed: $e");
      throw Exception();
    }
  }
}
