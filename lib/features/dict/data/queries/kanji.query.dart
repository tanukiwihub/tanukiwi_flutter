class GetKanjiRawQuery {
  String query(int kanjiId) {
    return '''
SELECT kanji.id AS k_id, kanji.literal AS k_literal,
kanji_misc.freq AS k_freq, kw_kanji_grade.value AS k_grade, kw_kanji_jlpt_new.value AS k_jlpt, kw_kanji_strokecount.value as k_stroke_count,
kanji_meaning.value AS k_meaning, kanji_meaning.position AS k_meaning_pos, kw_kanji_lang.value as k_meaning_lang,
kanji_reading.value AS k_reading, kanji_reading.position AS k_reading_pos, kw_kanji_readingtype.value as k_reading_type,
kanji_nanori.value AS k_nanori, kanji_nanori.position AS k_nanori_pos,
kanji_querycode.value AS k_querycode, kw_kanji_querycodetype.value AS k_querycode_type

FROM kanji 
 
JOIN kanji_misc ON kanji_misc.kanji_id = kanji.id
LEFT JOIN kw_kanji_grade ON  kw_kanji_grade.id = kanji_misc.grade_id
LEFT JOIN kw_kanji_jlpt_new ON kw_kanji_jlpt_new.id = kanji_misc.jlptNew_id
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
