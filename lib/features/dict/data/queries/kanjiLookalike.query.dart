class GetKanjiLookalikeRawQuery {
  String query(int kanjiId) {
    return '''
SELECT kanji.id AS id, kanji.literal AS literal, kw_kanji_strokecount.value AS stroke_count, kanji_meaning.value AS reading

FROM kanji_lookalike

LEFT JOIN kanji ON kanji.id = kanji_lookalike.kanji_lookalike_id

JOIN kanji_misc ON kanji_misc.kanji_id = kanji.id
JOIN kw_kanji_strokecount ON kw_kanji_strokecount.id = kanji_misc.strokeCount_id

JOIN kanji_meaning ON kanji_meaning.kanji_id = kanji.id
JOIN kw_kanji_lang ON kw_kanji_lang.id = kanji_meaning.kwLang_id AND  kw_kanji_lang.value = 'en'

WHERE kanji_lookalike.kanji_id = 1763

ORDER BY kanji_misc.freq ASC NULLS LAST, kanji_meaning.position
''';
  }
}
