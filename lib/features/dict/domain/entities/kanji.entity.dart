import 'package:equatable/equatable.dart';

import 'kanjiQueryCode.entity.dart';

class Kanji extends Equatable {
  final int id;
  final String literal;
  final int? freq;
  final int? grade;
  final int? jlpt;
  final int? strokeCount;
  final List<String> meaningEn;
  final List<String> readingJaKun;
  final List<String> readingJaOn;
  final List<String> nanori;
  final List<KanjiQueryCode> queryCode;

  const Kanji({
    required this.id,
    required this.literal,
    this.freq,
    this.grade,
    this.jlpt,
    this.strokeCount,
    required this.meaningEn,
    required this.readingJaKun,
    required this.readingJaOn,
    required this.nanori,
    required this.queryCode,
  });

  @override
  List<Object?> get props => [
        id,
        literal,
        strokeCount,
        grade,
        jlpt,
        freq,
        meaningEn,
        readingJaKun,
        readingJaOn,
        nanori,
        queryCode
      ];
}
