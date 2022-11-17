import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/exceptions/exceptions.dart';
import '../../../../common/exceptions/failures.dart';
import '../../domain/entities/kanji.entity.dart';
import '../../domain/repositories/kanji.repository.dart';
import '../datasources/kanji.datasource.local.dart';

class KanjiRepositoryImpl implements KanjiRepository {
  final KanjiDataSourceLocal dataSourceLocal;

  KanjiRepositoryImpl({
    required this.dataSourceLocal,
  });

  @override
  Future<Either<Failure, List<KanjiSearchResult>>> searchKanji(
      String key) async {
    try {
      final kanjis = await dataSourceLocal.searchKanji(key);
      return Right(kanjis);
    } on DbException {
      return Left(DbFailure());
    }
  }

  @override
  Future<Either<Failure, Kanji>> getKanji(int id) async {
    try {
      final kanji = await dataSourceLocal.getKanji(id);
      return Right(kanji);
    } on DbException {
      return Left(DbFailure());
    }
  }
}

final kanjiRespositoryProvider = Provider<KanjiRepository>((ref) {
  return KanjiRepositoryImpl(
    dataSourceLocal: ref.watch(kanjiDataSourceLocalProvider),
  );
});
