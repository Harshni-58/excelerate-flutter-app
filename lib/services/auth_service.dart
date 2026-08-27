import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _usersKey = 'registered_users';

  // Get all registered users
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();

    final String? usersJson = prefs.getString(_usersKey);

    if (usersJson == null) {
      return [];
    }

    final List<dynamic> decodedUsers = jsonDecode(usersJson);

    return decodedUsers
        .map((user) => Map<String, dynamic>.from(user))
        .toList();
  }

  // Register a new user
  static Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final users = await getUsers();

    // Check if email already exists
    final emailExists = users.any(
          (user) =>
      user['email'].toString().toLowerCase() ==
          email.toLowerCase(),
    );

    if (emailExists) {
      return false;
    }

    // Add new user
    users.add({
      'name': name,
      'email': email.toLowerCase(),
      'password': password,
    });

    // Convert users to JSON
    final String usersJson = jsonEncode(users);

    // Save users
    await prefs.setString(_usersKey, usersJson);

    return true;
  }

  // Login user
  static Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    final users = await getUsers();

    return users.any(
          (user) =>
      user['email'].toString().toLowerCase() ==
          email.toLowerCase() &&
          user['password'].toString() == password,
    );
  }
}