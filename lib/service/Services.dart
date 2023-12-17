import 'package:flutter/foundation.dart';
import 'package:frontend_web1/model/Tournament.dart';
import 'package:frontend_web1/model/User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/TournamentCategory.dart';

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
  Future<TournamentCategory> createCategory(int torNrId, TournamentCategory newCategory) async {
    try {
      final response = await http.post(
          Uri.parse('$userBaseUrl/torneios/$torNrId/categorias/cadastrar'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(newCategory.toJson()));
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Category successfully registered!");
        }
        return newCategory;
      } else {
        throw Exception("Failed to register category");
      }
    } catch (error) {
      throw Exception("Failed to register category $error");
    }
  }
  Future<User?> getUserByName(String usuTxNome) async {
    try {
      final response = await http.get(
        Uri.parse('$userBaseUrl/usuarios/buscarPorNome/$usuTxNome'),
        headers: {'Content-Type': 'application/json'},
      );

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = json.decode(response.body);
        print("Decoded user data: $userData");
        return User.fromJson(userData);
      } else if (response.statusCode == 404) {
        print("User not found");
        return null;
      } else {
        throw Exception("Failed to get user by name. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error getting user by name: $error");
      throw Exception("Failed to get user by name");
    }
  }
  Future<List<User>> getAllUsers() async{
    try{
      final response = await http.get(
          Uri.parse('$userBaseUrl/usuarios/listarTodosUsuarios'));
      if(response.statusCode == 200){
        List<dynamic> data = json.decode(response.body);
        List<User> users = data.map((json) => User.fromJson(json)).toList();
        return users;
      } else {
        throw Exception("Error when try to list all users - backend");
      }
    }catch (error){
      throw Exception("Error when try to list all users $error");
    }
  }

  Future<List<Tournament>> getAllTournaments() async{
    try{
      final response = await http.get(
        Uri.parse('$userBaseUrl/torneios/listarTodosTorneios'));
      if(response.statusCode == 200){
        List<dynamic> data = json.decode(response.body);
        List<Tournament> tournaments = data.map((json) => Tournament.fromJson(json)).toList();
        return tournaments;
      } else {
        throw Exception("Error when try to list tournaments - backend");
      }
    }catch (error){
      throw Exception("Error when try to list tournaments $error");
    }
  }
}
