import 'package:equatable/equatable.dart';

class Radical extends Equatable {
  final int id;
  final String literal;
  final int number;
  final int? strokeCount;
  final List<String> meaning;

  const Radical({
    required this.id,
    required this.literal,
    required this.number,
    this.strokeCount,
    required this.meaning,
  });

  @override
  List<Object?> get props => [
        id,
        literal,
        number,
        strokeCount,
        meaning,
      ];
}
