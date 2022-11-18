import 'package:equatable/equatable.dart';

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
