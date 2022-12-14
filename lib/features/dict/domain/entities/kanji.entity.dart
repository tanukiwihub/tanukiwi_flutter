// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class KanjiSearchResult extends Equatable {
  final int id;
  final String literal;
  final List<String> meaningEn;
  final List<String> readingJaKun;
  final List<String> readingJaOn;

  const KanjiSearchResult({
    required this.id,
    required this.literal,
    required this.meaningEn,
    required this.readingJaKun,
    required this.readingJaOn,
  });

  @override
  List<Object?> get props => [
        id,
        literal,
        meaningEn,
        readingJaKun,
        readingJaOn,
      ];
}
