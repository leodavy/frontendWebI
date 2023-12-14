import 'package:flutter/foundation.dart';
import 'package:frontend_web1/model/Tournament.dart';
import 'package:frontend_web1/model/User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Services{
  // final String userBaseUrl="http://192.168.0.105:8080"; //notebook
  final String userBaseUrl="http://192.168.0.107:8080"; //desktop

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
  Future<bool> authenticateUser(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$userBaseUrl/usuarios/autenticar'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'usuTxLogin': username,
          'usuTxSenha': password,
        }),
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("User successfully authenticated!");
        }
        return true;
      } else {
        if (kDebugMode) {
          print("Authentication failed: ${response.body}");
        }
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print("Authentication error: $error");
      }
      return false;
    }
  }
  Future<Tournament> createTournament(Tournament newTournament) async {
    try {
      final response = await http.post(
          Uri.parse('$userBaseUrl/torneios/cadastrar'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(newTournament.toJson()));
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Tournament successfully registered!");
        }
        return newTournament;
      } else {
        throw Exception("Failed to register tournament");
      }
    } catch (error) {
      throw Exception("Failed to register tournament");
    }
  }
}
