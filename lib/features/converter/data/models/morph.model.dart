import 'package:mecab_dart/mecab_dart.dart';
import 'package:kana_kit/kana_kit.dart';

import '../../domain/entities/morph.entity.dart';

class MorphTokenModel extends MorphToken {
  const MorphTokenModel({
    required String origin,
    required String phoneticRomaji,
  }) : super(
          origin: origin,
          phoneticRomaji: phoneticRomaji,
        );

  factory MorphTokenModel.fromTokenNode(TokenNode node) {
    const kanaKit = KanaKit();

    /*
    String pos1 = '';
    String pos2 = '';
    String pos3 = '';
    String pos4 = '';
    String infl_type = '';
    String infl_form = '';
    String base_form = '';
    String reading = '';
    */

    String? phonetic;
    String phoneticRomaji = '';

    for (var i = 0; i < node.features.length; i++) {
      /*
      if (i == 0) pos1 = node.features[0];
      if (i == 1) pos2 = node.features[1];
      if (i == 2) pos3 = node.features[2];
      if (i == 3) pos4 = node.features[3];
      if (i == 4) infl_type = node.features[4];
      if (i == 5) infl_form = node.features[5];
      if (i == 6) base_form = node.features[6];
      if (i == 7) reading = node.features[7];
      */
      if (i == 8) {
        phonetic = node.features[8];
      }

      phoneticRomaji = kanaKit.toRomaji(phonetic ?? node.surface);
    }

    return MorphTokenModel(
      origin: node.surface,
      phoneticRomaji: phoneticRomaji,
    );
  }
}
