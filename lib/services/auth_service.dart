import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'https://learn.smktelkom-mlg.sch.id/jobsheeker';

  /// REGISTER USER (SOCIETY)
  static Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateOfBirth,
    required String gender,
    required String address,
  }) async {
    final url = Uri.parse('$baseUrl/societies/create');

    final body = {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "date_of_birth": dateOfBirth,
      "gender": gender,
      "address": address,
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);
      return {
        "success": data["success"] ?? false,
        "message": data["message"] ?? "Unknown response",
        "data": data["data"],
      };
    } catch (e) {
      return {
        "success": false,
        "message": "Terjadi kesalahan: $e",
        "data": null,
      };
    }
  }

  /// LOGIN USER
  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/auth');
    final body = {
      "email": email,
      "password": password,
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          "success": true,
          "message": data["message"] ?? "Login berhasil",
          "token": data["token"], // kalau API pakai JWT
          "user": data["data"],   // kalau API balikin data user
        };
      } else {
        return {
          "success": false,
          "message": data["message"] ?? "Login gagal",
          "token": null,
          "user": null,
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Terjadi kesalahan: $e",
        "token": null,
        "user": null,
      };
    }
  }

  /// CEK EMAIL SUDAH TERDAFTAR
  static Future<bool> checkEmail(String email) async {
    final url = Uri.parse('$baseUrl/societies/check-email?email=$email');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['available'] == true;
      }
    } catch (_) {}
    return false;
  }
}
