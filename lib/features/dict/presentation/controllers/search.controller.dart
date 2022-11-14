import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/kanji.repository.dart';
import '../../domain/repositories/kanji.repository.dart';
import 'search.state.dart';

class SearchPageController extends StateNotifier<SearchState> {
  final KanjiRepository _kanjiRepository;

  final FocusNode searchFieldFocus = FocusNode();
  final TextEditingController searchFieldController = TextEditingController();

  SearchPageController(this._kanjiRepository) : super(const SearchInitial()) {
    _init();
  }

  void _init() {
    searchFieldController.addListener(_onSearchFieldChange);
    searchFieldFocus.addListener(_onSearchFieldFocus);
  }

  void _onSearchFieldChange() {
    if (searchFieldController.text.isEmpty) {
      state = const SearchActive();
    } else {
      if (state is SearchActive) {
        state = const SearchLoading();
      }
      _searchKanji(searchFieldController.text);
    }
  }

  void _onSearchFieldFocus() {
    if (searchFieldFocus.hasFocus && searchFieldController.text.isEmpty) {
      state = const SearchActive();
    }
  }

  void cancelSearch() {
    searchFieldController.clear();
    searchFieldFocus.unfocus();
    state = const SearchInitial();
  }

  void clearSearch() {
    searchFieldController.clear();
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
    StateNotifierProvider<SearchPageController, SearchState>((ref) {
  return SearchPageController(
    ref.watch(kanjiRespositoryProvider),
  );
});
