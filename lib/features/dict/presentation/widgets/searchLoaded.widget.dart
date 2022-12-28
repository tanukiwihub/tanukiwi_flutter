import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../common/theme/theme.widget.dart';
import '../../../../common/theme/widgets/listCell.widget.dart';
import '../../../../common/theme/widgets/scrollbar.widget.dart';
import '../../../../common/theme/widgets/separatedText.widget.dart';
import '../../domain/entities/kanji.entity.dart';

class SearchLoadedWidget extends StatelessWidget {
  final List<Kanji> kanji;

  const SearchLoadedWidget({Key? key, required this.kanji}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = TKXDtheme.of(context);

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
                theme.pagePaddingX,
                theme.space(1.0),
                theme.pagePaddingX,
                theme.space(0.25),
              ),
              child: Text(
                resultText,
                style: theme.text.caption1.copyWith(
                  color: theme.color.labelSecondary,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                String readingJaKunString = '';
                String readingJaOnString = '';

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
                            left: theme.space(.5),
                          ),
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: TextStyle(
                                color: theme.color.labelSecondary,
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
                                    color: theme.color.labelTertiary,
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
                  subtitle: TKXDseparatedText(
                    text: kanji[index].meaningEn,
                    seperatorColor: theme.color.labelSecondary,
                    style: TextStyle(
                      color: theme.color.labelPrimary,
                    ),
                  ),
                  onTap: () => {
                    context.beamToNamed(
                      '/dict/search/${kanji[index].id.toString()}/${kanji[index].literal}',
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
