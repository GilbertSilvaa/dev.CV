import 'dart:convert';
import '../../models/user_model.dart';
import '../services/api_constants.dart';
import 'package:http/http.dart' as http;

class UserService {
  static String baseUrl = ApiConstants.baseUrl;

  static Future<UserModel?> create({
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

      if (response.statusCode == 201) {
        return UserModel.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      throw Exception('Failed to create user: $error');
    }
    return null;
  }
}
