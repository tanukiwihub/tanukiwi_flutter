import 'package:dartz/dartz.dart';

import '../../../../common/exceptions/failures.dart';
import '../entities/kanji.entity.dart';
import '../entities/kanjiPart.entity.dart';

abstract class KanjiRepository {
  Future<Either<Failure, List<Kanji>>> searchKanji(String key);

  Future<Either<Failure, Kanji>> getKanji(int kanjiId);

  Future<Either<Failure, List<KanjiPart>>> getKanjiParts(int kanjiId);
}
