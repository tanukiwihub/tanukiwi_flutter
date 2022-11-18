import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/kanji.repository.dart';
import '../../domain/repositories/kanji.repository.dart';
import 'kanji.state.dart';

class KanjiPageController extends StateNotifier<KanjiState> {
  final KanjiRepository _kanjiRepository;
  final int _kanjiId;

  KanjiPageController(this._kanjiRepository, this._kanjiId)
      : super(const KanjiLoading()) {
    _init();
  }

  Future<void> _init() async {
    final kanjiResult = await _kanjiRepository.getKanji(_kanjiId);

    kanjiResult.fold((failure) {
      state = const KanjiError('');
    }, (success) {
      state = KanjiLoaded(
        kanji: success,
      );
    });
  }
}

final kanjiPageControllerProvider =
    StateNotifierProvider.family<KanjiPageController, KanjiState, int>(
        (ref, kanjiId) {
  return KanjiPageController(
    ref.watch(kanjiRespositoryProvider),
    kanjiId,
  );
});
