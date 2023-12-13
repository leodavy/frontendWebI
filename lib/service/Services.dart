import 'package:flutter/foundation.dart';
import 'package:frontend_web1/model/User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Services{
  final String userBaseUrl="localhost:8080";

  Future<User> createUser(User newUser) async {
    try {
      final response = await http.post(
          Uri.http('$userBaseUrl/usuarios/cadastrar'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(newUser.toJson()));
      if (response.statusCode == 201) {
        if (kDebugMode) {
          print("User successfully registered!");
        }
        return newUser;
      } else {
        if (kDebugMode) {
          print("Error: ${response.statusCode}");
        }
      throw Exception("Failed to register user");
      }
    } catch (error){
      if (kDebugMode) {
        print("Error: $error");
      }
      throw Exception("Failed to register user");
    }
  }
}