import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/kanji.entity.dart';

class SearchLoadedWidget extends StatelessWidget {
  final List<Kanji> kanji;

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

              var meaningEn = kanji[kanjiIndex].meaningEn;
              for (var a in meaningEn) {
                meaningString += a;
                if (a != meaningEn.last) {
                  meaningString += ', ';
                }
              }

              var readingJaKun = kanji[kanjiIndex].readingJaKun;
              for (var a in readingJaKun) {
                readingJaKunString += a;
                if (a != readingJaKun.last) {
                  readingJaKunString += ', ';
                }
              }

              var readingJaOn = kanji[kanjiIndex].readingJaOn;
              for (var a in readingJaOn) {
                readingJaOnString += a;
                if (a != readingJaOn.last) {
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
                onTap: () => {
                  context.goNamed(
                    "kanji",
                    params: {
                      "literal": kanji[kanjiIndex].literal,
                      "id": kanji[kanjiIndex].id.toString(),
                    },
                  ),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
