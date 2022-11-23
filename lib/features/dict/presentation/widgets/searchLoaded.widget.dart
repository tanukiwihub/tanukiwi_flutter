import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/kanji.entity.dart';

class SearchLoadedWidget extends StatelessWidget {
  final List<Kanji> kanji;

  const SearchLoadedWidget({Key? key, required this.kanji}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text('${kanji.length.toString()} kanji'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              String meaningString = '';
              String readingJaKunString = '';
              String readingJaOnString = '';

              var meaningEn = kanji[index].meaningEn;
              for (var a in meaningEn) {
                meaningString += a;
                if (a != meaningEn.last) {
                  meaningString += ', ';
                }
              }

              var readingJaKun = kanji[index].readingJaKun;
              for (var a in readingJaKun) {
                readingJaKunString += a;
                if (a != readingJaKun.last) {
                  readingJaKunString += ', ';
                }
              }

              var readingJaOn = kanji[index].readingJaOn;
              for (var a in readingJaOn) {
                readingJaOnString += a;
                if (a != readingJaOn.last) {
                  readingJaOnString += ', ';
                }
              }

              return ListTile(
                title: Text(
                  kanji[index].literal,
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
                      "literal": kanji[index].literal,
                      "id": kanji[index].id.toString(),
                    },
                  ),
                },
              );
            },
            childCount: kanji.length,
          ),
        )
      ],
    );
  }
}
