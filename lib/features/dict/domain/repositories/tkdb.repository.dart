import 'package:dartz/dartz.dart';

import '../../../../common/exceptions/failures.dart';
import '../entities/kanji.entity.dart';

abstract class TKDBrepository {
  Future<Either<Failure, List<Kanji>>> searchKanji(String key);

  Future<Either<Failure, Kanji>> getKanji(int kanjiId);
}
