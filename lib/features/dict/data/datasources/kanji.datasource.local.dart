import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagara_app/features/dict/data/queries/kanjiDicRef.query.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../common/exceptions/exceptions.dart';
import '../../../../common/utils/database.util.dart';
import '../../domain/entities/kanjiDicRef.entity.dart';
import '../models/kanji.model.dart';
import '../models/kanjiDicRef.model.dart';
import '../models/kanjiPart.model.dart';
import '../queries/kanji.query.dart';
import '../queries/kanjiAntonym.query.dart';
import '../queries/kanjiLookalike.query.dart';
import '../queries/kanjiPart.query.dart';
import '../queries/kanjiSynonym.query.dart';
import '../queries/searchKanji.query.dart';

abstract class KanjiDataSourceLocal {
  /// Get kanji search results from database
  Future<List<KanjiModel>> searchKanji(String key);

  Future<KanjiModel> getKanji(int kanjiId);

  Future<List<KanjiDicRef>> getKanjiDicRef(int kanjiId);

  Future<List<KanjiPartModel>> getKanjiParts(int kanjiId);

  Future<List<KanjiModel>> getKanjiLookalikes(int kanjiId);

  Future<List<KanjiModel>> getKanjiAntonyms(int kanjiId);

  Future<List<KanjiModel>> getKanjiSynonyms(int kanjiId);
}

class KanjiDataSourceLocalImpl implements KanjiDataSourceLocal {
  final Database db;

  KanjiDataSourceLocalImpl({required this.db});

  @override
  Future<List<KanjiModel>> searchKanji(String key) async {
    String query = SearchKanjiRawQuery().query(key);

    try {
      List<Map<String, dynamic>> rows = await db.rawQuery(query);

      List<List<Map<String, dynamic>>> distinctRows =
          _createDistinctLists(rows, 'k_literal');

      List<KanjiModel> result = [];

      for (var distinctRow in distinctRows) {
        result.add(KanjiModel.fromList(distinctRow));
      }

      return result;
    } catch (error) {
      debugPrint(error.toString());
      throw DbException();
    }
  }

  @override
  Future<KanjiModel> getKanji(int kanjiId) async {
    String query = GetKanjiRawQuery().query(kanjiId);

    try {
      List<Map<String, dynamic>> rows = await db.rawQuery(query);

      KanjiModel result = KanjiModel.fromList(rows);

      return result;
    } catch (error) {
      debugPrint(error.toString());
      throw DbException();
    }
  }

  @override
  Future<List<KanjiDicRefModel>> getKanjiDicRef(int kanjiId) async {
    String query = GetKanjiDicRefRawQuery().query(kanjiId);

    try {
      List<Map<String, dynamic>> rows = await db.rawQuery(query);

      List<KanjiDicRefModel> result = [];

      for (var row in rows) {
        result.add(KanjiDicRefModel.fromMap(row));
      }

      debugPrint(result.toString());

      return result;
    } catch (error) {
      debugPrint(error.toString());
      throw DbException();
    }
  }

  @override
  Future<List<KanjiPartModel>> getKanjiParts(int kanjiId) async {
    String query = GetKanjiPartRawQuery().query(kanjiId);

    try {
      List<Map<String, dynamic>> rows = await db.rawQuery(query);

      List<List<Map<String, dynamic>>> distinctRows =
          _createDistinctLists(rows, 'part_pos');

      List<KanjiPartModel> result = [];

      for (var distinctRow in distinctRows) {
        result.add(KanjiPartModel.fromList(distinctRow));
      }

      return result;
    } catch (error) {
      debugPrint(error.toString());
      throw DbException();
    }
  }

  @override
  Future<List<KanjiModel>> getKanjiLookalikes(int kanjiId) async {
    String query = GetKanjiLookalikeRawQuery().query(kanjiId);

    try {
      List<Map<String, dynamic>> rows = await db.rawQuery(query);

      List<List<Map<String, dynamic>>> distinctRows =
          _createDistinctLists(rows, 'k_id');

      List<KanjiModel> result = [];

      for (var distinctRow in distinctRows) {
        result.add(KanjiModel.fromList(distinctRow));
      }

      return result;
    } catch (error) {
      debugPrint(error.toString());
      throw DbException();
    }
  }

  @override
  Future<List<KanjiModel>> getKanjiAntonyms(int kanjiId) async {
    String query = GetKanjiAntonymRawQuery().query(kanjiId);

    try {
      List<Map<String, dynamic>> rows = await db.rawQuery(query);

      List<List<Map<String, dynamic>>> distinctRows =
          _createDistinctLists(rows, 'k_id');

      List<KanjiModel> result = [];

      for (var distinctRow in distinctRows) {
        result.add(KanjiModel.fromList(distinctRow));
      }

      return result;
    } catch (error) {
      debugPrint(error.toString());
      throw DbException();
    }
  }

  @override
  Future<List<KanjiModel>> getKanjiSynonyms(int kanjiId) async {
    String query = GetKanjiSynonymRawQuery().query(kanjiId);

    try {
      List<Map<String, dynamic>> rows = await db.rawQuery(query);

      List<List<Map<String, dynamic>>> distinctRows =
          _createDistinctLists(rows, 'k_id');

      List<KanjiModel> result = [];

      for (var distinctRow in distinctRows) {
        result.add(KanjiModel.fromList(distinctRow));
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
      var groupKey = item[itemKey].toString();

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
