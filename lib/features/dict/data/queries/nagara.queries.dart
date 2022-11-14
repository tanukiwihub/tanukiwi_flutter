import 'package:kana_kit/kana_kit.dart';

class SearchKanjiRawQuery {
  static const kanaKit = KanaKit();

  String query(String key) {
    if (kanaKit.isKanji(key)) {
    } else if (kanaKit.isKana(key)) {
    } else {}
    return '''
SELECT 
kanji.id, kanji.literal,  
kanji_meaning.value as meaning, kanji_meaning.position as meaning_pos, kw_kanji_lang.value as meaning_lang,
kanji_reading.value as reading, kanji_reading.position as reading_pos, kw_kanji_readingtype.value as reading_type

FROM kanji
 
JOIN kanji_misc ON kanji_misc.kanji_id = kanji.id

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

    WHERE kanji.literal LIKE '%$key%' OR kanji_meaning.value LIKE '%$key%'  OR replace(kanji_reading.value, '.', '')  LIKE '%$key%'
)

ORDER BY kanji_misc.freq ASC NULLS LAST
    ''';
  }
}
