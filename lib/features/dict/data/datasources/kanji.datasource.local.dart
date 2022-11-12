import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../common/exceptions/exceptions.dart';
import '../../../../common/utils/database.util.dart';
import '../models/kanji.model.dart';
import '../queries/nagara.queries.dart';

abstract class KanjiDataSourceLocal {
  /// Get kanji search results from database
  Future<List<KanjiSearchResultModel>> searchKanji(String key);
}

class KanjiDataSourceLocalImpl implements KanjiDataSourceLocal {
  final Database db;

  KanjiDataSourceLocalImpl({required this.db});

  @override
  Future<List<KanjiSearchResultModel>> searchKanji(String key) async {
    String query = SearchKanjiRawQuery().query(key);

    try {
      List<Map<String, dynamic>> rows = await db.rawQuery(query);

      List<List<Map<String, dynamic>>> distinctRows =
          _createDistinctLists(rows, 'literal');

      List<KanjiSearchResultModel> result = [];

      for (var distinctRow in distinctRows) {
        result.add(KanjiSearchResultModel.fromList(distinctRow));
      }

      return result;
    } catch (error) {
      debugPrint(error.toString());
      throw DbException();
    }
  }

  List<List<Map<String, dynamic>>> _createDistinctLists(
    List<Map<String, dynamic>> list,
    String itemKey,
  ) {
    Map<String, List<Map<String, dynamic>>> groupedLists = {};

    for (var item in list) {
      var groupKey = item[itemKey];

      if (!groupedLists.containsKey(groupKey)) {
        groupedLists[groupKey] = [];
      }

      groupedLists[groupKey]!.add(item);
    }

    List<List<Map<String, dynamic>>> distinctLists = [];

    for (var key in groupedLists.keys) {
      distinctLists.add(groupedLists[key]!);
    }

    return distinctLists;
  }
}

final kanjiDataSourceLocalProvider = Provider<KanjiDataSourceLocal>((ref) {
  return KanjiDataSourceLocalImpl(db: ref.watch(databaseUtilProvider).database);
});
