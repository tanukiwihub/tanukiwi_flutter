import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mecab_dart/mecab_dart.dart';

class MecabUtil {
  static Future<Mecab> init() async {
    final tagger = Mecab();
    await tagger.init("assets/ipadic", true);
    return tagger;
  }
}

final mecabUtilProvider = Provider<Mecab>((ref) {
  throw UnimplementedError();
});
