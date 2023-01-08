import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanukiwi/features/converter/domain/entities/morph.entity.dart';

import '../../../../common/exceptions/failures.dart';
import '../../data/repositories/morph.repository.dart';
import '../respositories/morph.repository.dart';

class ConverterService {
  ConverterService({
    required this.morphRepository,
  });
  final MorphRepository morphRepository;

  Either<Failure, List<MorphToken>> getMorphs(String input) {
    return morphRepository.getMorphs(input);
  }
}

final converterServiceProvider = Provider<ConverterService>((ref) {
  return ConverterService(
    morphRepository: ref.watch(morphRespositoryProvider),
  );
});
