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
  final List<KanjiPart>? parts;
  final List<Kanji>? lookalikes;

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
    this.parts,
    this.lookalikes,
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
        parts,
        lookalikes,
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
    List<KanjiPart>? parts,
    List<Kanji>? lookalikes,
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
      parts: parts ?? this.parts,
      lookalikes: lookalikes ?? this.lookalikes,
    );
  }
}
