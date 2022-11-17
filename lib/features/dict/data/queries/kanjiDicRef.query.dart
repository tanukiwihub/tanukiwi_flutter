class KanjiDicRefRawQuery {
  String query(int kanjiId) {
    return '''
SELECT kanji_dicref.value AS dicRef, kw_kanji_dicref.value AS dicRefType, kanji_dicref.mPage AS mPage, kw_kanji_morohashivol.value as mVol

FROM kanji_dicref

JOIN kw_kanji_dicref ON kw_kanji_dicref.id = kanji_dicref.kwDicRefType_id
LEFT JOIN kw_kanji_morohashivol ON kw_kanji_morohashivol.id = kanji_dicref.kwMorohashiVol_id OR kw_kanji_morohashivol.id = NULL

WHERE kanji_dicref.kanji_id = $kanjiId
''';
  }
}
