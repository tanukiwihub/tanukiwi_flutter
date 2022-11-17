import '../../domain/entities/kanji.entity.dart';

class KanjiModel extends Kanji {
  const KanjiModel({
    required int id,
    required String literal,
    required int strokeCount,
    int? grade,
    int? jlpt,
    int? freq,
    required List<String> meaningEn,
    required List<String> readingJaKun,
    required List<String> readingJaOn,
    required List<String> nanori,
    required List<KanjiQueryCode> queryCode,
  }) : super(
          id: id,
          literal: literal,
          strokeCount: strokeCount,
          grade: grade,
          jlpt: jlpt,
          freq: freq,
          meaningEn: meaningEn,
          readingJaKun: readingJaKun,
          readingJaOn: readingJaOn,
          nanori: nanori,
          queryCode: queryCode,
        );

  factory KanjiModel.fromList(List<Map<String, dynamic>> list) {
    List<String> meaningEn = [];
    List<String> readingJaKun = [];
    List<String> readingJaOn = [];
    List<String> nanori = [];
    List<KanjiQueryCode> queryCode = [];

    // Meaning filtering
    var filteredMeaning = list.where((a) => a['meaning_pos'] != null).toList();

    filteredMeaning.sort((a, b) => a['meaning_pos'] - b['meaning_pos']);

    for (var a in filteredMeaning) {
      if (!meaningEn.contains(a['meaning'])) {
        meaningEn.add(a['meaning']);
      }
    }

    // Reading Ja Kun filtering
    var filteredReadingJaKun = list
        .where((a) => a['reading_pos'] != null && a['reading_type'] == 'ja_kun')
        .toList();

    filteredReadingJaKun.sort((a, b) => a['reading_pos'] - b['reading_pos']);

    for (var a in filteredReadingJaKun) {
      if (!readingJaKun.contains(a['reading'])) {
        readingJaKun.add(a['reading']);
      }
    }

    // Reading Ja On filtering
    var filteredReadingJaOn = list
        .where((a) => a['reading_pos'] != null && a['reading_type'] == 'ja_on')
        .toList();

    filteredReadingJaOn.sort((a, b) => a['reading_pos'] - b['reading_pos']);

    for (var a in filteredReadingJaOn) {
      if (!readingJaOn.contains(a['reading'])) {
        readingJaOn.add(a['reading']);
      }
    }

    return KanjiModel(
      id: list.first['id'],
      literal: list.first['literal'],
      strokeCount: list.first['stroke_count'],
      grade: list.first['grade'],
      freq: list.first['freq'],
      jlpt: list.first['jlpt'],
      meaningEn: meaningEn,
      readingJaKun: readingJaKun,
      readingJaOn: readingJaOn,
      nanori: nanori,
      queryCode: queryCode,
    );
  }
}

class KanjiSearchResultModel extends KanjiSearchResult {
  const KanjiSearchResultModel({
    required int id,
    required String literal,
    required int strokeCount,
    int? grade,
    int? jlpt,
    int? freq,
    required List<String> meaningEn,
    required List<String> readingJaKun,
    required List<String> readingJaOn,
  }) : super(
          id: id,
          literal: literal,
          grade: grade,
          strokeCount: strokeCount,
          jlpt: jlpt,
          freq: freq,
          meaningEn: meaningEn,
          readingJaKun: readingJaKun,
          readingJaOn: readingJaOn,
        );

  factory KanjiSearchResultModel.fromList(List<Map<String, dynamic>> list) {
    List<String> meaningEn = [];
    List<String> readingJaKun = [];
    List<String> readingJaOn = [];

    // Meaning filtering
    var filteredMeaning = list.where((a) => a['meaning_pos'] != null).toList();

    filteredMeaning.sort((a, b) => a['meaning_pos'] - b['meaning_pos']);

    for (var a in filteredMeaning) {
      if (!meaningEn.contains(a['meaning'])) {
        meaningEn.add(a['meaning']);
      }
    }

    // Reading Ja Kun filtering
    var filteredReadingJaKun = list
        .where((a) => a['reading_pos'] != null && a['reading_type'] == 'ja_kun')
        .toList();

    filteredReadingJaKun.sort((a, b) => a['reading_pos'] - b['reading_pos']);

    for (var a in filteredReadingJaKun) {
      if (!readingJaKun.contains(a['reading'])) {
        readingJaKun.add(a['reading']);
      }
    }

    // Reading Ja On filtering
    var filteredReadingJaOn = list
        .where((a) => a['reading_pos'] != null && a['reading_type'] == 'ja_on')
        .toList();

    filteredReadingJaOn.sort((a, b) => a['reading_pos'] - b['reading_pos']);

    for (var a in filteredReadingJaOn) {
      if (!readingJaOn.contains(a['reading'])) {
        readingJaOn.add(a['reading']);
      }
    }

    return KanjiSearchResultModel(
      id: list.first['id'],
      literal: list.first['literal'],
      strokeCount: list.first['stroke_count'],
      freq: list.first['freq'],
      jlpt: list.first['jlpt'],
      meaningEn: meaningEn,
      readingJaKun: readingJaKun,
      readingJaOn: readingJaOn,
    );
  }
}
