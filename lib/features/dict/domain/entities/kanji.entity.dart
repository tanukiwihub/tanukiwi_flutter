// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Kanji extends Equatable {
  final int id;
  final String literal;
  final int? freq;
  final int? grade;
  final int? jlpt;
  final int strokeCount;
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
    required this.strokeCount,
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

abstract class KanjiQueryCode {
  final String type;
  final String value;

  KanjiQueryCode({
    required this.type,
    required this.value,
  });
}

class KanjiSearchResult extends Equatable {
  final int id;
  final String literal;
  final int strokeCount;
  final int? grade;
  final int? jlpt;
  final int? freq;
  final List<String> meaningEn;
  final List<String> readingJaKun;
  final List<String> readingJaOn;

  const KanjiSearchResult({
    required this.id,
    required this.literal,
    required this.strokeCount,
    this.grade,
    this.jlpt,
    this.freq,
    required this.meaningEn,
    required this.readingJaKun,
    required this.readingJaOn,
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
      ];
}
