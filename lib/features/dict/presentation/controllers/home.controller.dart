import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/kanji.repository.dart';
import '../../domain/repositories/kanji.repository.dart';
import 'home.state.dart';

class HomeScreenController extends StateNotifier<HomeState> {
  final KanjiRepository _kanjiRepository;

  HomeScreenController(this._kanjiRepository) : super(const HomeInitial());

  Future<void> searchKanji(String key) async {
    state = const HomeLoading();
    final result = await _kanjiRepository.searchKanji(key);
    result.fold((failure) {
      state = const HomeError('');
    }, (kanji) {
      state = HomeLoaded(kanji);
    });
  }
}

final homeScreenControllerProvider =
    StateNotifierProvider.autoDispose<HomeScreenController, HomeState>((ref) {
  return HomeScreenController(
    ref.watch(kanjiRespositoryProvider),
  );
});
