import 'dart:convert';
import 'package:dev_cv/models/user_model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://dev-cv-api.onrender.com';

  static Future<UserModel> createUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var data = {'name': name, 'email': email, 'password': password};

      final response = await http.post(
        Uri.parse('$baseUrl/user/create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      print(response.body);

      return UserModel.fromJson(jsonDecode(response.body));
    } catch (error) {
      throw Exception('Failed to create user: $error');
    }
  }
}
