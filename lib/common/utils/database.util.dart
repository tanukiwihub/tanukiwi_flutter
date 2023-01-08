import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../constants/db.constants.dart';

class DatabaseUtil {
  static Future<Database> init() async {
    final databasesPath = await getDatabasesPath();
    final path = p.join(databasesPath, NagaraDbConstants.dbName);

    // Check if the database exists
    final exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      debugPrint("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(p.dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(
        p.join(
          "assets",
          NagaraDbConstants.dbName,
        ),
      );
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    }
    // open the database
    final Database database = await openDatabase(path, readOnly: true);
    debugPrint("Database opened");

    return database;
  }
}

final databaseUtilProvider = Provider<Database>((ref) {
  throw UnimplementedError();
});
