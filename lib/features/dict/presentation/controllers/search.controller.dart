import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/tkdb.repository.dart';
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

  void _onSearchFieldChange() {
    if (searchFieldController.text.isEmpty) {
      state = const SearchInitial();
    } else {
      _searchKanji(searchFieldController.text);
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

  Future<void> _searchKanji(String key) async {
    final result = await _kanjiRepository.searchKanji(key);
    result.fold((failure) {
      state = const SearchError('');
    }, (success) {
      state = SearchLoaded(kanji: success);
    });
  }
}

final searchPageControllerProvider =
    StateNotifierProvider.autoDispose<SearchPageController, SearchState>((ref) {
  return SearchPageController(
    ref.watch(tkdbRespositoryProvider),
  );
});
