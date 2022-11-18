// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:nagara_app/features/dict/domain/entities/kanjiPart.entity.dart';

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
      part: part ?? this.part,
      lookalike: lookalike ?? this.lookalike,
      antonym: antonym ?? this.antonym,
      synonym: synonym ?? this.synonym,
    );
  }
}
