class GetKanjiSynonymRawQuery {
  String query(int kanjiId) {
    return '''
SELECT kanji.id AS k_id, kanji.literal AS k_literal, kw_kanji_strokecount.value AS k_stroke_count, kanji_meaning.value AS k_meaning, kanji_meaning.position AS k_meaning_pos

FROM kanji_synonym

LEFT JOIN kanji ON kanji.id = kanji_synonym.kanji_synonym_id

JOIN kanji_misc ON kanji_misc.kanji_id = kanji.id
LEFT JOIN kw_kanji_strokecount ON kw_kanji_strokecount.id = kanji_misc.strokeCount_id

LEFT JOIN kanji_meaning ON kanji_meaning.kanji_id = kanji.id
JOIN kw_kanji_lang ON kw_kanji_lang.id = kanji_meaning.kwLang_id AND  kw_kanji_lang.value = 'en'

WHERE kanji_synonym.kanji_id = $kanjiId

ORDER BY kanji_misc.freq ASC NULLS LAST
''';
  }
}
