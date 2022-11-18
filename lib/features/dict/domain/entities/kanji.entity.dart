import 'package:equatable/equatable.dart';

import 'kanjiDicRef.entity.dart';
import 'kanjiPart.entity.dart';

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
  final List<KanjiDicRef>? dicRef;
  final List<KanjiPart>? part;
  final List<Kanji>? lookalike;
  final List<Kanji>? antonym;
  final List<Kanji>? synonym;

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
    this.dicRef,
    this.part,
    this.lookalike,
    this.antonym,
    this.synonym,
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
        queryCode,
        dicRef,
        part,
        lookalike,
        antonym,
        synonym,
      ];

  Kanji copyWith({
    int? id,
    String? literal,
    int? freq,
    int? grade,
    int? jlpt,
    int? strokeCount,
    List<String>? meaningEn,
    List<String>? readingJaKun,
    List<String>? readingJaOn,
    List<String>? nanori,
    List<KanjiQueryCode>? queryCode,
    List<KanjiDicRef>? dicRef,
    List<KanjiPart>? part,
    List<Kanji>? lookalike,
    List<Kanji>? antonym,
    List<Kanji>? synonym,
  }) {
    return Kanji(
      id: id ?? this.id,
      literal: literal ?? this.literal,
      freq: freq ?? this.freq,
      grade: grade ?? this.grade,
      jlpt: jlpt ?? this.jlpt,
      strokeCount: strokeCount ?? this.strokeCount,
      meaningEn: meaningEn ?? this.meaningEn,
      readingJaKun: readingJaKun ?? this.readingJaKun,
      readingJaOn: readingJaOn ?? this.readingJaOn,
      nanori: nanori ?? this.nanori,
      queryCode: queryCode ?? this.queryCode,
      dicRef: dicRef ?? this.dicRef,
      part: part ?? this.part,
      lookalike: lookalike ?? this.lookalike,
      antonym: antonym ?? this.antonym,
      synonym: synonym ?? this.synonym,
    );
  }
}

class KanjiQueryCode extends Equatable {
  final String type;
  final String value;

  const KanjiQueryCode({
    required this.type,
    required this.value,
  });

  @override
  List<Object?> get props => [
        type,
        value,
      ];
}
