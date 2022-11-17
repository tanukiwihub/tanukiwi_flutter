class KanjiPartRawQuery {
  String query(int kanjiId) {
    return '''
SELECT cross_kanji_part.position AS pos, cross_kanji_part.part_component,
radical.id AS radical_id, radical.literal AS radical_literal, radical.number AS radical_number, radical.stroke_count AS radical_stroke_count,
kanji.id AS kanji_id, kanji.literal AS kanji_literal

FROM cross_kanji_part

LEFT JOIN radical ON radical.id = cross_kanji_part.part_radical_id
LEFT JOIN kanji ON kanji.id = cross_kanji_part.part_kanji_id

WHERE cross_kanji_part.kanji_id = $kanjiId
''';
  }
}
