import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tanukiwi/common/theme/widgets/list.widget.dart';
import 'package:tanukiwi/common/theme/widgets/scrollbar.widget.dart';

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

    return TKXDscrollbar(
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                TKXDtheme.of(context).pagePaddingX,
                TKXDtheme.of(context).space(1.0),
                TKXDtheme.of(context).pagePaddingX,
                TKXDtheme.of(context).space(0.25),
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
                    meaningString += '; ';
                  }
                }

                var readingJaKun = kanji[index].readingJaKun;
                for (var a in readingJaKun) {
                  readingJaKunString += a.replaceAll(".", "");
                  if (a != readingJaKun.last) {
                    readingJaKunString += '; ';
                  }
                }

                var readingJaOn = kanji[index].readingJaOn;
                for (var a in readingJaOn) {
                  readingJaOnString += a.replaceAll(".", "");
                  if (a != readingJaOn.last) {
                    readingJaOnString += '; ';
                  }
                }

                return TKXDlistCell(
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        kanji[index].literal,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: TKXDtheme.of(context).space(.5),
                          ),
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: TextStyle(
                                color:
                                    TKXDtheme.of(context).color.labelSecondary,
                              ),
                              children: [
                                TextSpan(
                                  text: readingJaKunString,
                                ),
                                TextSpan(
                                  text: readingJaKunString != '' &&
                                          readingJaOnString != ''
                                      ? ' • '
                                      : '',
                                  style: TextStyle(
                                    color: TKXDtheme.of(context)
                                        .color
                                        .labelTertiary,
                                  ),
                                ),
                                TextSpan(
                                  text: readingJaOnString,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  subtitle: Text(
                    meaningString,
                    style: TextStyle(
                      color: TKXDtheme.of(context).color.labelPrimary,
                    ),
                  ),
                  onTap: () => {
                    context.pushNamed(
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
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          )
        ],
      ),
    );
  }
}
