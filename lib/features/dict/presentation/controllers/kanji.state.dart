import 'package:equatable/equatable.dart';
import 'package:nagara_app/features/dict/domain/entities/kanjiPart.entity.dart';

import '../../domain/entities/kanji.entity.dart';

abstract class KanjiState with EquatableMixin {
  const KanjiState();

  @override
  List<Object> get props {
    return [];
  }
}

class KanjiLoading extends KanjiState {
  const KanjiLoading();
}

class KanjiLoaded extends KanjiState {
  final Kanji kanji;
  final List<KanjiPart> kanjiParts;

  KanjiLoaded({
    required this.kanji,
    required this.kanjiParts,
  });

  @override
  List<Object> get props => super.props
    ..addAll([
      kanji,
      kanjiParts,
    ]);
}

class KanjiError extends KanjiState {
  final String message;
  const KanjiError(this.message);

  @override
  List<Object> get props => super.props..addAll([message]);
}
