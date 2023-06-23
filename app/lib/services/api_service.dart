import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://dev-cv-api.onrender.com';

  static Future<dynamic> post({
    required String url,
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl$url'),
        headers: headers,
        body: body != null ? json.encode(body) : null,
      );
      // print(response.statusCode);

      return jsonDecode(response.body);
    } catch (error) {
      throw Exception('Failed api request: $error');
    }
  }
}
