import 'package:dartz/dartz.dart';

import '../../../../common/exceptions/failures.dart';
import '../entities/kanji.entity.dart';

abstract class KanjiRepository {
  Future<Either<Failure, List<KanjiSearchResult>>> searchKanji(String key);

  Future<Either<Failure, Kanji>> getKanji(int id);
}
