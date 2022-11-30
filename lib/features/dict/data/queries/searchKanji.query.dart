class SearchKanjiRawQuery {
  String query(String key) {
    return '''
SELECT 
kanji.id AS k_id, kanji.literal AS k_literal,  
kanji_misc.freq AS k_freq, kw_kanji_grade.value AS k_grade, kw_kanji_jlpt_new.value AS k_jlpt, kw_kanji_strokecount.value AS k_stroke_count,
kanji_meaning.value AS k_meaning, kanji_meaning.position AS k_meaning_pos, kw_kanji_lang.value AS k_meaning_lang,
kanji_reading.value AS k_reading, kanji_reading.position AS k_reading_pos, kw_kanji_readingtype.value AS k_reading_type

FROM kanji
 
JOIN kanji_misc ON kanji_misc.kanji_id = kanji.id
LEFT JOIN kw_kanji_grade ON  kw_kanji_grade.id = kanji_misc.grade_id
LEFT JOIN kw_kanji_jlpt_new ON kw_kanji_jlpt_new.id = kanji_misc.jlptNew_id
LEFT JOIN kw_kanji_strokecount ON kw_kanji_strokecount.id = kanji_misc.strokeCount_id

JOIN kanji_meaning ON kanji_meaning.kanji_id = kanji.id
JOIN kw_kanji_lang ON kw_kanji_lang.id = kanji_meaning.kwLang_id AND  kw_kanji_lang.value = 'en'

JOIN kanji_reading ON kanji_reading.kanji_id = kanji.id
JOIN kw_kanji_readingtype ON kw_kanji_readingtype.id = kanji_reading.kwKanjiReadingType_id AND (kw_kanji_readingtype.value = 'ja_kun' OR  kw_kanji_readingtype.value = 'ja_on' )

WHERE kanji.id IN
(    
	SELECT 
    kanji.id

    FROM kanji

	  JOIN kanji_meaning ON kanji_meaning.kanji_id = kanji.id
    JOIN kw_kanji_lang ON kw_kanji_lang.id = kanji_meaning.kwLang_id AND  kw_kanji_lang.value = 'en'

    JOIN kanji_reading ON kanji_reading.kanji_id = kanji.id
    JOIN kw_kanji_readingtype ON kw_kanji_readingtype.id = kanji_reading.kwKanjiReadingType_id AND (kw_kanji_readingtype.value = 'ja_kun' OR  kw_kanji_readingtype.value = 'ja_on' )

    WHERE kanji.literal LIKE '$key' OR kanji_meaning.value LIKE '%$key%'  OR replace(kanji_reading.value, '.', '')  LIKE '$key%'
)

ORDER BY kanji_misc.freq ASC NULLS LAST
    ''';
  }
}
