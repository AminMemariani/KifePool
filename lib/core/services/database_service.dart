import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  static Isar? _isar;
  static const String _databaseName = 'kifepool_db';

  static Future<Isar> get instance async {
    if (_isar != null) return _isar!;
    
    _isar = await _initDatabase();
    return _isar!;
  }

  static Future<Isar> _initDatabase() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [],
        directory: dir.path,
        name: _databaseName,
      );
      
      if (kDebugMode) {
        print('Database initialized at: ${dir.path}/$_databaseName.isar');
      }
      
      return isar;
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing database: $e');
      }
      rethrow;
    }
  }

  static Future<void> close() async {
    if (_isar != null) {
      await _isar!.close();
      _isar = null;
    }
  }

  static Future<void> clearDatabase() async {
    final isar = await instance;
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
