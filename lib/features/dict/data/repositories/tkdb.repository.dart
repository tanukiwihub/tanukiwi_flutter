import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/exceptions/exceptions.dart';
import '../../../../common/exceptions/failures.dart';
import '../../domain/entities/kanji.entity.dart';
import '../../domain/repositories/tkdb.repository.dart';
import '../datasources/tkdb.datasource.local.dart';

class TKDBrepositoryImpl implements TKDBrepository {
  final TKDBdataSourceLocal dataSourceLocal;

  TKDBrepositoryImpl({
    required this.dataSourceLocal,
  });

  @override
  Future<Either<Failure, List<Kanji>>> searchKanji(String key) async {
    try {
      final kanjis = await dataSourceLocal.searchKanji(key);
      return Right(kanjis);
    } on DbException {
      return Left(DbFailure());
    }
  }

  @override
  Future<Either<Failure, Kanji>> getKanji(int kanjiId) async {
    try {
      final kanji = await dataSourceLocal.getKanji(kanjiId);
      final kanjiDicRef = await dataSourceLocal.getKanjiDicRef(kanjiId);
      final kanjiParts = await dataSourceLocal.getKanjiParts(kanjiId);
      final kanjiLookalikes = await dataSourceLocal.getKanjiLookalikes(kanjiId);
      final kanjiAntonyms = await dataSourceLocal.getKanjiAntonyms(kanjiId);
      final kanjiSynonyms = await dataSourceLocal.getKanjiSynonyms(kanjiId);

      final kanjiPlus = kanji.copyWith(
        dicRef: kanjiDicRef,
        part: kanjiParts,
        lookalike: kanjiLookalikes,
        antonym: kanjiAntonyms,
        synonym: kanjiSynonyms,
      );

      return Right(kanjiPlus);
    } on DbException {
      return Left(DbFailure());
    }
  }
}

final tkdbRespositoryProvider = Provider<TKDBrepository>((ref) {
  return TKDBrepositoryImpl(
    dataSourceLocal: ref.watch(tkdbDataSourceLocalProvider),
  );
});
