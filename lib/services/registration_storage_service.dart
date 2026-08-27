import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class RegistrationStorageService {
  const RegistrationStorageService();

  Future<String> _getFilePath() async {
    final directory =
    await getApplicationDocumentsDirectory();

    return '${directory.path}${Platform.pathSeparator}registrations.json';
  }

  Future<String> saveRegistration({
    required String programId,
    required String programTitle,
    required String fullName,
    required String email,
    required String phone,
  }) async {
    final filePath = await _getFilePath();
    final file = File(filePath);

    final registrations =
    await _readRegistrations(file);

    registrations.add({
      'id': DateTime.now()
          .microsecondsSinceEpoch
          .toString(),

      'programId': programId,

      'programTitle': programTitle,

      'fullName': fullName.trim(),

      'email': email.trim().toLowerCase(),

      'phone': phone.trim(),

      'submittedAt':
      DateTime.now()
          .toUtc()
          .toIso8601String(),
    });

    const encoder = JsonEncoder.withIndent('  ');

    await file.writeAsString(
      encoder.convert(registrations),
      flush: true,
    );

    return file.path;
  }

  Future<List<Map<String, dynamic>>>
  _readRegistrations(File file) async {
    if (!await file.exists()) {
      return <Map<String, dynamic>>[];
    }

    final contents =
    await file.readAsString();

    if (contents.trim().isEmpty) {
      return <Map<String, dynamic>>[];
    }

    final decoded = jsonDecode(contents);

    if (decoded is! List) {
      throw const FormatException(
        'Existing registrations file is invalid.',
      );
    }

    return decoded
        .map(
          (item) =>
      Map<String, dynamic>.from(
        item as Map,
      ),
    )
        .toList();
  }

  Future<List<Map<String, dynamic>>>
  getRegistrations() async {
    final filePath =
    await _getFilePath();

    final file = File(filePath);

    return _readRegistrations(file);
  }

  Future<List<Map<String, dynamic>>>
  getRegistrationsByEmail(String email) async {
    final registrations = await getRegistrations();

    final normalizedEmail =
    email.trim().toLowerCase();

    return registrations.where((registration) {
      final registrationEmail =
      registration['email']
          ?.toString()
          .trim()
          .toLowerCase();

      return registrationEmail == normalizedEmail;
    }).toList();
  }
}