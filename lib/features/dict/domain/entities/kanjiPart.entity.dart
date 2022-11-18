import 'package:equatable/equatable.dart';

import 'kanji.entity.dart';
import 'radical.entity.dart';

class KanjiPart extends Equatable {
  final int position;
  final Kanji? kanji;
  final Radical? radical;
  final String? component;

  const KanjiPart({
    required this.position,
    this.kanji,
    this.radical,
    this.component,
  });

  @override
  List<Object?> get props => [
        position,
        kanji,
        radical,
        component,
      ];
}
