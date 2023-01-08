import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mecab_dart/mecab_dart.dart';

import '../../../../common/utils/mecab.util.dart';
import '../models/morph.model.dart';

abstract class MecabAnalyzer {
  List<MorphTokenModel> getMorphs(String input);
}

class MecabAnalyzerImpl implements MecabAnalyzer {
  final Mecab mecab;

  MecabAnalyzerImpl({required this.mecab});

  @override
  List<MorphTokenModel> getMorphs(String input) {
    List<MorphTokenModel> result = [];

    final tokens = mecab.parse(input).cast<TokenNode>();

    // Length is -1 to skip "EOS" entry
    for (var i = 0; i < tokens.length - 1; i++) {
      result.add(MorphTokenModel.fromTokenNode(tokens[i]));
    }
    return result;
  }
}

final mecabAnalyzerProvider = Provider<MecabAnalyzer>((ref) {
  return MecabAnalyzerImpl(mecab: ref.watch(mecabUtilProvider));
});
