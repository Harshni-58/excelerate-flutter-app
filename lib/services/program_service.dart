import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/program.dart';

class ProgramService {
  Future<List<Program>> fetchPrograms() async {
    try {
      // Load the JSON file from the assets folder
      final jsonString =
      await rootBundle.loadString('assets/programs.json');

      // Convert JSON text into a Dart list
      final List<dynamic> jsonData = jsonDecode(jsonString);

      // Convert each JSON object into a Program object
      return jsonData
          .map(
            (item) => Program.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList();
    } catch (e) {
      throw Exception('Failed to load programs: $e');
    }
  }
}