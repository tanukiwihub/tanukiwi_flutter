class KanjiRawQuery {
  String query(int kanjiId) {
    return '''
SELECT kanji.*,
kanji_misc.freq, kw_kanji_grade.value AS grade, kw_kanji_jlpt.value AS jlpt, kw_kanji_strokecount.value as stroke_count,
kanji_meaning.value AS meaning, kanji_meaning.position AS meaning_pos, kw_kanji_lang.value as meaning_lang,
kanji_reading.value AS reading, kanji_reading.position AS reading_pos, kw_kanji_readingtype.value as reading_type,
kanji_nanori.value AS nanori, kanji_nanori.position AS nanori_pos,
kanji_querycode.value AS querycode, kw_kanji_querycodetype.value AS querycode_type

FROM kanji 
 
JOIN kanji_misc ON kanji_misc.kanji_id = kanji.id
LEFT JOIN kw_kanji_grade ON  kw_kanji_grade.id = kanji_misc.grade_id
LEFT JOIN kw_kanji_jlpt ON kw_kanji_jlpt.id = kanji_misc.jlpt_id
LEFT JOIN kw_kanji_strokecount ON kw_kanji_strokecount.id = kanji_misc.strokeCount_id

LEFT JOIN kanji_meaning ON kanji_meaning.kanji_id = kanji.id
JOIN kw_kanji_lang ON kw_kanji_lang.id = kanji_meaning.kwLang_id AND  kw_kanji_lang.value = 'en'

LEFT JOIN kanji_reading ON kanji_reading.kanji_id = kanji.id
JOIN kw_kanji_readingtype ON kw_kanji_readingtype.id = kanji_reading.kwKanjiReadingType_id AND (kw_kanji_readingtype.value = 'ja_kun' OR  kw_kanji_readingtype.value = 'ja_on' )

LEFT JOIN kanji_nanori ON kanji_nanori.kanji_id = kanji.id

LEFT JOIN kanji_querycode ON kanji_querycode.kanji_id = kanji.id
LEFT JOIN kw_kanji_querycodetype ON kw_kanji_querycodetype.id = kanji_querycode.kwQueryCodeType_id AND kanji_querycode.kwSkipMisclass_id IS NULL

WHERE kanji.id = $kanjiId
''';
  }
}
