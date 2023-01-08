import 'package:dartz/dartz.dart';

import '../../../../common/exceptions/failures.dart';
import '../entities/morph.entity.dart';

abstract class MorphRepository {
  Either<Failure, List<MorphToken>> getMorphs(String input);
}
