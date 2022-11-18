import 'package:equatable/equatable.dart';

class KanjiDicRef extends Equatable {
  final String value;
  final String type;
  final int? mPage;
  final String? mVol;

  const KanjiDicRef({
    required this.type,
    required this.value,
    this.mPage,
    this.mVol,
  });

  @override
  List<Object?> get props => [
        type,
        value,
        mPage,
        mVol,
      ];
}
