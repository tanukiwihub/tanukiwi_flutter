import 'package:async/async.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/exceptions/failures.dart';
import '../../data/repositories/tkdb.repository.dart';
import '../../domain/entities/kanji.entity.dart';
import '../../domain/repositories/tkdb.repository.dart';
import 'search.state.dart';

class SearchPageController extends StateNotifier<SearchState> {
  final TKDBrepository _kanjiRepository;

  final FocusNode searchFieldFocus = FocusNode();
  final TextEditingController searchFieldController = TextEditingController();

  SearchPageController(this._kanjiRepository) : super(const SearchInitial()) {
    _init();
  }

  void _init() {
    searchFieldController.addListener(_onSearchFieldChange);
  }

  Future<void> _onSearchFieldChange() async {
    await _cancelableSearch?.cancel();
    if (searchFieldController.text.isEmpty) {
      state = const SearchInitial();
    } else {
      _cancelableSearch = CancelableOperation.fromFuture(
        _kanjiRepository.searchKanji(searchFieldController.text),
      );
      final result = await _cancelableSearch?.value;
      if (result != null) {
        result.fold((failure) {
          state = const SearchError('');
        }, (success) {
          state = SearchLoaded(kanji: success);
        });
      }
    }
  }

  void navigateBack(BuildContext context) {
    context.go(
      "/",
    );
  }

  void clearSearch() {
    searchFieldController.clear();
    searchFieldFocus.requestFocus();
  }

  CancelableOperation<Either<Failure, List<Kanji>>>? _cancelableSearch;
}

final searchPageControllerProvider =
    StateNotifierProvider.autoDispose<SearchPageController, SearchState>((ref) {
  return SearchPageController(
    ref.watch(tkdbRespositoryProvider),
  );
});
