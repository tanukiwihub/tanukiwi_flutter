import '../../domain/entities/kanji.entity.dart';
import '../../domain/entities/kanjiPart.entity.dart';
import '../../domain/entities/radical.entity.dart';
import 'kanji.model.dart';
import 'radical.model.dart';

class KanjiPartModel extends KanjiPart {
  const KanjiPartModel({
    required int position,
    Kanji? kanji,
    Radical? radical,
    String? component,
  }) : super(
          position: position,
          kanji: kanji,
          radical: radical,
          component: component,
        );

  factory KanjiPartModel.fromList(List<Map<String, dynamic>> list) {
    return KanjiPartModel(
      position: list.first['part_pos'],
      kanji: list.first['k_id'] != null ? KanjiModel.fromList(list) : null,
      radical: list.first['r_id'] != null ? RadicalModel.fromList(list) : null,
      component: list.first['part_component'],
    );
  }
}
