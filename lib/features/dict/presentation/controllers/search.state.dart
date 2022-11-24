import 'package:equatable/equatable.dart';

import '../../domain/entities/kanji.entity.dart';

abstract class SearchState with EquatableMixin {
  const SearchState();

  @override
  List<Object> get props {
    return [];
  }
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoaded extends SearchState {
  final List<Kanji> kanji;

  SearchLoaded({required this.kanji});

  @override
  List<Object> get props => super.props..addAll([kanji]);
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);

  @override
  List<Object> get props => super.props..addAll([message]);
}
