class GetKanjiPartRawQuery {
  String query(int kanjiId) {
    return '''
SELECT cross_kanji_part.position AS part_pos, cross_kanji_part.part_component,
radical.id AS r_id, radical.literal AS r_literal, radical.number AS r_number, radical.stroke_count AS r_stroke_count, radical_meaning.value as r_meaning, radical_meaning.position AS r_meaning_pos,
kanji.id AS k_id, kanji.literal AS k_literal, kw_kanji_strokecount.value AS k_stroke_count, kanji_meaning.value AS k_meaning, kanji_meaning.position AS k_meaning_pos

FROM cross_kanji_part

LEFT JOIN radical ON radical.id = cross_kanji_part.part_radical_id
LEFT JOIN radical_meaning ON radical_meaning.radical_id = radical.id

LEFT JOIN kanji ON kanji.id = cross_kanji_part.part_kanji_id
LEFT JOIN kanji_misc on kanji_misc.kanji_id = kanji.id
JOIN kw_kanji_strokecount ON kw_kanji_strokecount.id = kanji_misc.strokeCount_id
LEFT JOIN kanji_meaning ON kanji_meaning.kanji_id = kanji.id
JOIN kw_kanji_lang ON kw_kanji_lang.id = kanji_meaning.kwLang_id AND  kw_kanji_lang.value = 'en'

WHERE cross_kanji_part.kanji_id = $kanjiId
''';
  }
}
