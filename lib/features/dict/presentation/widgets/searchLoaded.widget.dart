import 'package:flutter/material.dart';

import '../../domain/entities/kanji.entity.dart';

class SearchLoadedWidget extends StatelessWidget {
  final List<KanjiSearchResult> kanji;

  const SearchLoadedWidget({Key? key, required this.kanji}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${kanji.length.toString()} kanji'),
          ListView.builder(
            itemCount: kanji.length < 32 ? kanji.length : 32,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int kanjiIndex) {
              String meaningString = '';
              String readingJaKunString = '';
              String readingJaOnString = '';

              for (var a in kanji[kanjiIndex].meaningEn) {
                meaningString += a;
                if (a != kanji[kanjiIndex].meaningEn.last) {
                  meaningString += ', ';
                }
              }

              for (var a in kanji[kanjiIndex].readingJaKun) {
                readingJaKunString += a;
                if (a != kanji[kanjiIndex].readingJaKun.last) {
                  readingJaKunString += ', ';
                }
              }

              for (var a in kanji[kanjiIndex].readingJaOn) {
                readingJaOnString += a;
                if (a != kanji[kanjiIndex].readingJaOn.last) {
                  readingJaOnString += ', ';
                }
              }

              return ListTile(
                title: Text(
                  kanji[kanjiIndex].literal,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meaningString,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: readingJaKunString,
                          ),
                          TextSpan(
                            text: readingJaKunString != '' &&
                                    readingJaOnString != ''
                                ? ' • '
                                : '',
                          ),
                          TextSpan(
                            text: readingJaOnString,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    ;
  }
}
