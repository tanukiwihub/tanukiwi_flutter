import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/kanji.repository.dart';
import '../../domain/repositories/kanji.repository.dart';
import 'search.state.dart';

final FocusNode searchFieldFocus = FocusNode();
final TextEditingController searchFieldController = TextEditingController();

class SearchPageController extends StateNotifier<SearchState> {
  final KanjiRepository _kanjiRepository;

  SearchPageController(this._kanjiRepository) : super(const SearchInitial()) {
    _init();
  }

  void _init() {
    searchFieldController.addListener(_onSearchFieldChange);
    searchFieldFocus.addListener(_onSearchFieldFocus);
  }

  void _setInitialState() {
    state = const SearchInitial();
  }

  void _setActiveState() {
    state = const SearchActive();
  }

  void _onSearchFieldChange() {
    if (searchFieldController.text.isEmpty) {
      _setActiveState();
    } else {
      _searchKanji(searchFieldController.text);
    }
  }

  void _onSearchFieldFocus() {
    if (searchFieldFocus.hasFocus && searchFieldController.text.isEmpty) {
      _setActiveState();
    }
  }

  void cancelSearch() {
    searchFieldController.clear();
    searchFieldFocus.unfocus();
    _setInitialState();
  }

  void clearSearch() {
    searchFieldController.clear();
  }

  Future<void> _searchKanji(String key) async {
    final result = await _kanjiRepository.searchKanji(key);
    result.fold((failure) {
      state = const SearchError('');
    }, (kanji) {
      state = SearchLoaded(kanji);
    });
  }
}

final searchPageControllerProvider =
    StateNotifierProvider.autoDispose<SearchPageController, SearchState>((ref) {
  return SearchPageController(
    ref.watch(kanjiRespositoryProvider),
  );
});
