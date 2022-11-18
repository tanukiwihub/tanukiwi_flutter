import '../../domain/entities/kanji.entity.dart';
import '../../domain/entities/kanjiQueryCode.entity.dart';

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
    List<String> meaningEn = [];
    List<String> readingJaKun = [];
    List<String> readingJaOn = [];
    List<String> nanori = [];
    List<KanjiQueryCode> queryCode = [];

    // Meaning filtering
    var filteredMeaningEn =
        list.where((a) => a['k_meaning_pos'] != null).toList();
    filteredMeaningEn.sort((a, b) => a['k_meaning_pos'] - b['k_meaning_pos']);
    for (var a in filteredMeaningEn) {
      if (!meaningEn.contains(a['k_meaning'])) {
        meaningEn.add(a['k_meaning']);
      }
    }

    // Reading Ja Kun filtering
    var filteredReadingJaKun = list
        .where((a) =>
            a['k_reading_pos'] != null && a['k_reading_type'] == 'ja_kun')
        .toList();
    filteredReadingJaKun
        .sort((a, b) => a['k_reading_pos'] - b['k_reading_pos']);
    for (var a in filteredReadingJaKun) {
      if (!readingJaKun.contains(a['k_reading'])) {
        readingJaKun.add(a['k_reading']);
      }
    }

    // Reading Ja On filtering
    var filteredReadingJaOn = list
        .where(
            (a) => a['k_reading_pos'] != null && a['k_reading_type'] == 'ja_on')
        .toList();
    filteredReadingJaOn.sort((a, b) => a['k_reading_pos'] - b['k_reading_pos']);
    for (var a in filteredReadingJaOn) {
      if (!readingJaOn.contains(a['k_reading'])) {
        readingJaOn.add(a['k_reading']);
      }
    }

    // Reading Ja On filtering
    var filteredNanori = list.where((a) => a['k_nanori_pos'] != null).toList();
    filteredNanori.sort((a, b) => a['k_nanori_pos'] - b['k_nanori_pos']);
    for (var a in filteredNanori) {
      if (!nanori.contains(a['k_nanori'])) {
        nanori.add(a['k_nanori']);
      }
    }

    // queryCode
    var filteredQuerycode = list
        .where((a) => a['k_querycode'] != null && a['k_querycode_type'] != null)
        .toList();
    for (var a in filteredQuerycode) {
      var asd =
          KanjiQueryCode(type: a['k_querycode_type'], value: a['k_querycode']);
      if (!queryCode.contains(asd)) {
        queryCode.add(
          asd,
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
      meaningEn: meaningEn,
      readingJaKun: readingJaKun,
      readingJaOn: readingJaOn,
      nanori: nanori,
      queryCode: queryCode,
    );
  }
}
