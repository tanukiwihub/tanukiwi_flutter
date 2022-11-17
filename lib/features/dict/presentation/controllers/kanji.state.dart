import 'package:equatable/equatable.dart';

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

  KanjiLoaded({required this.kanji});

  @override
  List<Object> get props => super.props..addAll([kanji]);
}

class KanjiError extends KanjiState {
  final String message;
  const KanjiError(this.message);

  @override
  List<Object> get props => super.props..addAll([message]);
}
