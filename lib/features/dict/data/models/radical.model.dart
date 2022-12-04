import '../../domain/entities/radical.entity.dart';

class RadicalModel extends Radical {
  const RadicalModel({
    required int id,
    required String literal,
    required int number,
    required int strokeCount,
    required List<String> meaning,
  }) : super(
          id: id,
          literal: literal,
          number: number,
          strokeCount: strokeCount,
          meaning: meaning,
        );

  factory RadicalModel.fromList(List<Map<String, dynamic>> list) {
    List<String> meaning = [];

    // Meaning filtering
    var filteredMeaning =
        list.where((a) => a['r_meaning_pos'] != null).toList();
    filteredMeaning.sort((a, b) => a['r_meaning_pos'] - b['r_meaning_pos']);
    for (var a in filteredMeaning) {
      if (!meaning.contains(a['r_meaning'])) {
        meaning.add(a['r_meaning']);
      }
    }

    return RadicalModel(
      id: list.first['r_id'],
      literal: list.first['r_literal'],
      number: list.first['r_number'],
      strokeCount: list.first['r_stroke_count'],
      meaning: meaning,
    );
  }
}
