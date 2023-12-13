import 'package:flutter/foundation.dart';
import 'package:frontend_web1/model/User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Services{
  final String userBaseUrl="http://192.168.0.105:8080";

  Future<User> createUser(User newUser) async {
    try {
      final response = await http.post(
          Uri.parse('$userBaseUrl/usuarios/cadastrar'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(newUser.toJson()));
      if (response.statusCode == 200) {
          if (kDebugMode) {
            print("User successfully registered!");
          }

        return newUser;
      } else {
        throw Exception("Failed to register user");
      }
    } catch (error) {
      throw Exception("Failed to register user");
    }
  }
}