import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/kanji.repository.dart';
import '../../domain/entities/kanji.entity.dart';
import '../../domain/entities/kanjiPart.entity.dart';
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
    final kanjiPartsResult = await _kanjiRepository.getKanjiParts(_kanjiId);
    final kanjiLookalikesResult =
        await _kanjiRepository.getKanjiLookalikes(_kanjiId);

    List<KanjiPart> kanjiParts = [];
    List<Kanji> kanjiLookalikes = [];

    kanjiPartsResult.fold((failure) {
      state = const KanjiError('');
    }, (success) {
      kanjiParts = success;
    });

    kanjiLookalikesResult.fold((failure) {
      state = const KanjiError('');
    }, (success) {
      kanjiLookalikes = success;
    });

    kanjiResult.fold((failure) {
      state = const KanjiError('');
    }, (success) {
      state = KanjiLoaded(
        kanji: success,
        kanjiParts: kanjiParts,
        kanjiLookalikes: kanjiLookalikes,
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
