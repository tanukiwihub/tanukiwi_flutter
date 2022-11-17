import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagara_app/features/dict/presentation/controllers/search.state.dart';

import '../../data/repositories/kanji.repository.dart';
import '../../domain/repositories/kanji.repository.dart';
import 'kanji.state.dart';

class KanjiPageController extends StateNotifier<KanjiState> {
  final KanjiRepository _kanjiRepository;

  KanjiPageController(this._kanjiRepository) : super(const KanjiLoading());

  Future<void> init({required int kanjiId}) async {
    final result = await _kanjiRepository.getKanji(kanjiId);
    result.fold((failure) {
      state = const KanjiError('');
    }, (success) {
      state = KanjiLoaded(kanji: success);
    });
  }
}

final kanjiPageControllerProvider =
    StateNotifierProvider<KanjiPageController, KanjiState>((ref) {
  return KanjiPageController(
    ref.watch(kanjiRespositoryProvider),
  );
});
