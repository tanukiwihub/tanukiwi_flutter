class KanjiSynonymRawQuery {
  String query(int kanjiId) {
    return '''
SELECT kanji.id AS id, kanji.literal AS literal, kw_kanji_strokecount.value AS stroke_count, kanji_meaning.value AS reading

FROM kanji_synonym

LEFT JOIN kanji ON kanji.id = kanji_synonym.kanji_synonym_id

JOIN kanji_misc ON kanji_misc.kanji_id = kanji.id
JOIN kw_kanji_strokecount ON kw_kanji_strokecount.id = kanji_misc.strokeCount_id

JOIN kanji_meaning ON kanji_meaning.kanji_id = kanji.id
JOIN kw_kanji_lang ON kw_kanji_lang.id = kanji_meaning.kwLang_id AND  kw_kanji_lang.value = 'en'

WHERE kanji_synonym.kanji_id = $kanjiId

ORDER BY kanji_misc.freq ASC NULLS LAST, kanji_meaning.position
''';
  }
}
