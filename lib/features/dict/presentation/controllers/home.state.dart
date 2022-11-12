import 'package:equatable/equatable.dart';

import '../../domain/entities/kanji.entity.dart';

abstract class HomeState with EquatableMixin {
  const HomeState();

  @override
  List<Object> get props {
    return [];
  }
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<KanjiSearchResult> result;
  const HomeLoaded(this.result);

  @override
  List<Object> get props => super.props..addAll([result]);
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object> get props => super.props..addAll([message]);
}
