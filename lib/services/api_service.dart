import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {
  static Future<http.Response> postChatBudaya(Map<String, dynamic> body) {
    final url = Uri.parse('$BACKEND_URL/hukum_fiqih');
    return http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }
}
