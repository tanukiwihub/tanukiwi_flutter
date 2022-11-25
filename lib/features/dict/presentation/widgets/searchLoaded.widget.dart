import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme/theme.widget.dart';
import '../../domain/entities/kanji.entity.dart';

class SearchLoadedWidget extends StatelessWidget {
  final List<Kanji> kanji;

  const SearchLoadedWidget({Key? key, required this.kanji}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String resultText =
        '${kanji.length.toString()} result${kanji.length > 1 ? 's' : ''} in kanji'
            .toUpperCase();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              TKXDtheme.of(context).pagePaddingX,
              TKXDtheme.of(context).space(1.0),
              TKXDtheme.of(context).pagePaddingX,
              TKXDtheme.of(context).space(.5),
            ),
            child: Text(
              resultText,
              style: TKXDtheme.of(context).text.caption1.copyWith(
                    color: TKXDtheme.of(context).color.labelSecondary,
                  ),
            ),
          ),
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
