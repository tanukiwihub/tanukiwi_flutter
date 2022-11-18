import '../../domain/entities/kanji.entity.dart';

class KanjiModel extends Kanji {
  const KanjiModel({
    required int id,
    required String literal,
    int? strokeCount,
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
    List<String> meaningEnEntries = [];
    List<String> readingJaKunEntries = [];
    List<String> readingJaOnEntries = [];
    List<String> nanoriEntries = [];
    List<KanjiQueryCode> queryCodeEntries = [];

    // Get distinct sorted meaning entries
    var filteredMeaningEn =
        list.where((a) => a['k_meaning_pos'] != null).toList();
    filteredMeaningEn.sort((a, b) => a['k_meaning_pos'] - b['k_meaning_pos']);
    for (var a in filteredMeaningEn) {
      if (!meaningEnEntries.contains(a['k_meaning'])) {
        meaningEnEntries.add(a['k_meaning']);
      }
    }

    // Get distinct sorted kun reading entries
    var filteredReadingJaKun = list
        .where((a) =>
            a['k_reading_pos'] != null && a['k_reading_type'] == 'ja_kun')
        .toList();
    filteredReadingJaKun
        .sort((a, b) => a['k_reading_pos'] - b['k_reading_pos']);
    for (var a in filteredReadingJaKun) {
      if (!readingJaKunEntries.contains(a['k_reading'])) {
        readingJaKunEntries.add(a['k_reading']);
      }
    }

    // Get distinct sorted on reading entries
    var filteredReadingJaOn = list
        .where(
            (a) => a['k_reading_pos'] != null && a['k_reading_type'] == 'ja_on')
        .toList();
    filteredReadingJaOn.sort((a, b) => a['k_reading_pos'] - b['k_reading_pos']);
    for (var a in filteredReadingJaOn) {
      if (!readingJaOnEntries.contains(a['k_reading'])) {
        readingJaOnEntries.add(a['k_reading']);
      }
    }

    // Get distinct sorted nanori entries
    var filteredNanori = list.where((a) => a['k_nanori_pos'] != null).toList();
    filteredNanori.sort((a, b) => a['k_nanori_pos'] - b['k_nanori_pos']);
    for (var a in filteredNanori) {
      if (!nanoriEntries.contains(a['k_nanori'])) {
        nanoriEntries.add(a['k_nanori']);
      }
    }

    // Get distinct sorted query code entries
    var filteredQuerycode = list
        .where((a) => a['k_querycode'] != null && a['k_querycode_type'] != null)
        .toList();
    for (var a in filteredQuerycode) {
      var queryCode =
          KanjiQueryCode(type: a['k_querycode_type'], value: a['k_querycode']);
      if (!queryCodeEntries.contains(queryCode)) {
        queryCodeEntries.add(
          queryCode,
        );
      }
    }

    return KanjiModel(
      id: list.first['k_id'],
      literal: list.first['k_literal'],
      strokeCount: list.first['k_stroke_count'],
      grade: list.first['k_grade'],
      freq: list.first['k_freq'],
      jlpt: list.first['k_jlpt'],
      meaningEn: meaningEnEntries,
      readingJaKun: readingJaKunEntries,
      readingJaOn: readingJaOnEntries,
      nanori: nanoriEntries,
      queryCode: queryCodeEntries,
    );
  }
}
