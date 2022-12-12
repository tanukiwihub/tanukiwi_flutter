import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/tkdb.repository.dart';
import '../../domain/entities/kanji.entity.dart';
import '../../domain/repositories/tkdb.repository.dart';
import 'kanji.state.dart';

class KanjiPageController extends StateNotifier<KanjiState> {
  final TKDBrepository _kanjiRepository;
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

  void navigateBack(BuildContext context) {
    context.pop();
  }

  void navigateToKanji(BuildContext context, Kanji kanji) {
    context.pushNamed(
      "kanji",
      params: {
        "literal": kanji.literal,
        "id": kanji.id.toString(),
      },
    );
  }
}

final kanjiPageControllerProvider =
    StateNotifierProvider.family<KanjiPageController, KanjiState, int>(
        (ref, kanjiId) {
  return KanjiPageController(
    ref.watch(tkdbRespositoryProvider),
    kanjiId,
  );
});
