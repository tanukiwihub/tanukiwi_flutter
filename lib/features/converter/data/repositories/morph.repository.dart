import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/exceptions/exceptions.dart';
import '../../../../common/exceptions/failures.dart';
import '../../domain/entities/morph.entity.dart';
import '../../domain/respositories/morph.repository.dart';
import '../analyzer/mecab.analyzer.dart';

class MorphRepositoryImpl implements MorphRepository {
  final MecabAnalyzer morphAnalyzer;

  MorphRepositoryImpl({
    required this.morphAnalyzer,
  });

  @override
  Either<Failure, List<MorphToken>> getMorphs(String input) {
    try {
      final morphs = morphAnalyzer.getMorphs(input);
      return Right(morphs);
    } on DbException {
      return Left(DbFailure());
    }
  }
}

final morphRespositoryProvider = Provider<MorphRepository>((ref) {
  return MorphRepositoryImpl(
    morphAnalyzer: ref.watch(mecabAnalyzerProvider),
  );
});
