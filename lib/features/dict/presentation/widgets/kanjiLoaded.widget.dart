import 'package:flutter/widgets.dart';
import 'package:tanukiwi/common/theme/widgets/separatedText.widget.dart';

import '../../../../common/constants/kanji.constants.dart';
import '../../../../common/theme/theme.widget.dart';
import '../../../../common/theme/widgets/list.widget.dart';
import '../../../../common/theme/widgets/listCell.widget.dart';
import '../../../../common/theme/widgets/scrollbar.widget.dart';
import '../../../../common/theme/widgets/tag.widget.dart';
import '../../domain/entities/kanji.entity.dart';

class KanjiLoadedWidget extends StatelessWidget {
  const KanjiLoadedWidget({
    super.key,
    required this.kanji,
  });

  final Kanji kanji;

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    List<Widget> listViewChildren = [];

    //
    // Title
    //
    Widget title = Padding(
      padding: EdgeInsets.fromLTRB(
        theme.pagePaddingX,
        theme.space(1.5),
        theme.pagePaddingX,
        theme.space(.75),
      ),
      child: Text(
        kanji.literal,
        style: theme.defaultTextStyle.copyWith(
          fontSize: 80,
          height: 1,
        ),
      ),
    );
    listViewChildren.add(title);

    //
    // Subtitle
    //
    Widget? subtitle;
    String? subtitleString = '';
    if (kanji.strokeCount != null) {
      subtitleString +=
          '${kanji.strokeCount} ${kanji.strokeCount! > 1 ? 'strokes' : 'stroke'}';
      if (kanji.freq != null) {
        subtitleString += ' • ';
      }
    }
    if (kanji.freq != null) {
      subtitleString += '${kanji.freq} of 2500 most used kanji';
    }
    if (subtitleString != '') {
      subtitle = Padding(
        padding: EdgeInsets.fromLTRB(
          theme.pagePaddingX,
          theme.space(0.0),
          theme.pagePaddingX,
          theme.space(.5),
        ),
        child: Text(
          subtitleString,
          style: theme.text.subheadline.copyWith(
            color: theme.color.labelSecondary,
          ),
        ),
      );
      listViewChildren.add(subtitle);
    }

    //
    // Tags
    //
    Widget? tags;
    List<TKXDtag> tagWidgets = [];
    if (kanji.grade != null) {
      final labelGrade = KanjiConstants.getLabelGrade(kanji.grade!);
      final labelKyouiku = KanjiConstants.getLabelKyouiku(kanji.grade!);
      final labelListType = KanjiConstants.getLabelListType(kanji.grade!);

      if (labelListType != null) {
        tagWidgets.add(
          TKXDtag(
            label: labelListType,
            color: theme.color.highlightBlue,
            background: theme.color.highlightBgBlue,
          ),
        );
      }

      if (labelKyouiku != null) {
        tagWidgets.add(
          TKXDtag(
            label: labelKyouiku,
            color: theme.color.highlightPurple,
            background: theme.color.highlightBgPurple,
          ),
        );
      }

      if (labelGrade != null) {
        tagWidgets.add(
          TKXDtag(
            label: labelGrade,
            color: theme.color.highlightPurple,
            background: theme.color.highlightBgPurple,
          ),
        );
      }
    }
    if (kanji.jlpt != null) {
      final label = KanjiConstants.getLabelJLPT(kanji.jlpt!);
      if (label != null) {
        tagWidgets.add(
          TKXDtag(
            label: label,
            color: theme.color.highlightGreen,
            background: theme.color.highlightBgGreen,
          ),
        );
      }
    }
    if (tagWidgets.isNotEmpty) {
      tags = Padding(
        padding: EdgeInsets.fromLTRB(
          theme.pagePaddingX,
          0,
          theme.pagePaddingX,
          theme.space(1.5),
        ),
        child: Wrap(
          spacing: theme.space(.5),
          runSpacing: theme.space(.5),
          children: tagWidgets,
        ),
      );
      listViewChildren.add(tags);
    }

    //
    // Meanings
    //
    if (kanji.meaningEn.isNotEmpty) {
      Widget meaningWidget = TKXDlistElevated(
        title: 'MEANINGS',
        children: [
          TKXDlistCell(
            title: TKXDseparatedText(
              text: kanji.meaningEn,
              seperatorColor: theme.color.labelSecondary,
            ),
            titleMultiline: true,
          ),
        ],
      );
      listViewChildren.add(meaningWidget);
    }

    //
    // Readings
    //
    if (kanji.readingJaKun.isNotEmpty || kanji.readingJaOn.isNotEmpty) {
      List<TKXDlistCell> readingListChildren = [];

      if (kanji.readingJaKun.isNotEmpty) {
        readingListChildren.add(
          TKXDlistCell(
            title: TKXDseparatedText(
              text:
                  kanji.readingJaKun.map((a) => a.replaceAll('.', '')).toList(),
              seperatorColor: theme.color.labelSecondary,
            ),
            subtitle: const Text('Kun\'Yomi'),
            titleMultiline: true,
          ),
        );
      }

      if (kanji.readingJaOn.isNotEmpty) {
        readingListChildren.add(
          TKXDlistCell(
            title: TKXDseparatedText(
              text:
                  kanji.readingJaOn.map((a) => a.replaceAll('.', '')).toList(),
              seperatorColor: theme.color.labelSecondary,
            ),
            subtitle: const Text('On\'Yomi'),
            titleMultiline: true,
          ),
        );
      }

      Widget readingsWidget = TKXDlistElevated(
        title: 'READINGS',
        children: readingListChildren,
      );
      listViewChildren.add(readingsWidget);
    }

    //
    // Components
    //
    var kanjiPart = kanji.part;
    if (kanjiPart != null && kanjiPart.isNotEmpty) {
      List<TKXDlistCell> componentsListChildren = [];

      for (var i = 0; i < kanjiPart.length; i++) {
        var partRadical = kanjiPart[i].radical;
        var partKanji = kanjiPart[i].kanji;
        var partComponent = kanjiPart[i].component;

        if (partRadical != null) {
          componentsListChildren.add(
            TKXDlistCell(
              onTap: () {},
              prefixIcon: Text(
                partRadical.literal,
                style: theme.listCellPrefixKanjiStyle,
              ),
              title: TKXDseparatedText(
                text: partRadical.meaning,
                seperatorColor: theme.color.labelSecondary,
              ),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Radical #${partRadical.number}',
                    ),
                    TextSpan(
                      text: ' • ',
                      style: TextStyle(
                        color: theme.color.labelTertiary,
                      ),
                    ),
                    TextSpan(
                      text:
                          '${partRadical.strokeCount} stroke${partRadical.strokeCount > 1 ? 's' : ''}',
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (partComponent != null) {
          componentsListChildren.add(
            TKXDlistCell(
              prefixIcon: Text(
                partComponent,
                style: theme.listCellPrefixKanjiStyle,
              ),
              title: Text(
                'no meaning',
                style: theme.listCellTitleStyle.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              subtitle: const Text(
                'Component',
              ),
            ),
          );
        } else if (partKanji != null) {
          List<InlineSpan> descriptionChildren = [
            const TextSpan(
              text: 'Kanji',
            ),
          ];

          var partKanjiStrokeCount = partKanji.strokeCount;
          if (partKanjiStrokeCount != null) {
            descriptionChildren.add(TextSpan(
              text: ' • ',
              style: TextStyle(
                color: theme.color.labelTertiary,
              ),
            ));
            descriptionChildren.add(TextSpan(
              text:
                  '${partKanji.strokeCount} stroke${partKanjiStrokeCount > 1 ? 's' : ''}',
            ));
          }

          componentsListChildren.add(
            TKXDlistCell(
              onTap: () {},
              prefixIcon: Text(
                partKanji.literal,
                style: theme.listCellPrefixKanjiStyle,
              ),
              title: TKXDseparatedText(
                text: partKanji.meaningEn,
                seperatorColor: theme.color.labelSecondary,
              ),
              subtitle: Text.rich(
                TextSpan(children: descriptionChildren),
              ),
            ),
          );
        }
      }

      Widget componentsWidget = TKXDlistElevated(
        title: 'COMPONENTS',
        children: componentsListChildren,
      );
      listViewChildren.add(componentsWidget);
    }

    //
    // Lookalikes
    //
    var kanjiLookalikes = kanji.lookalike;
    if (kanjiLookalikes != null && kanjiLookalikes.isNotEmpty) {
      List<TKXDlistCell> lookalikesListChildren = [];

      for (var lookalike in kanjiLookalikes) {
        var strokecountText = '';
        var strokecount = lookalike.strokeCount;
        if (strokecount != null) {
          strokecountText = '$strokecount stroke${strokecount > 1 ? 's' : ''}';
        }

        lookalikesListChildren.add(
          TKXDlistCell(
            onTap: () {},
            prefixIcon: Text(
              lookalike.literal,
              style: theme.listCellPrefixKanjiStyle,
            ),
            title: TKXDseparatedText(
              text: lookalike.meaningEn,
              seperatorColor: theme.color.labelSecondary,
            ),
            subtitle: Text(
              strokecountText,
            ),
          ),
        );
      }

      Widget lookalikesWidget = TKXDlistElevated(
        title: 'SIMILAR KANJI',
        children: lookalikesListChildren,
      );
      listViewChildren.add(lookalikesWidget);
    }

    //
    // Synonyms
    //
    var kanjiSynonyms = kanji.synonym;
    if (kanjiSynonyms != null && kanjiSynonyms.isNotEmpty) {
      List<TKXDlistCell> synonymsListChildren = [];

      for (var synonym in kanjiSynonyms) {
        var strokecountText = '';
        var strokecount = synonym.strokeCount;
        if (strokecount != null) {
          strokecountText = '$strokecount stroke${strokecount > 1 ? 's' : ''}';
        }

        synonymsListChildren.add(
          TKXDlistCell(
            onTap: () {},
            prefixIcon: Text(
              synonym.literal,
              style: theme.listCellPrefixKanjiStyle,
            ),
            title: TKXDseparatedText(
              text: synonym.meaningEn,
              seperatorColor: theme.color.labelSecondary,
            ),
            subtitle: Text(
              strokecountText,
            ),
          ),
        );
      }

      Widget synonymsWidget = TKXDlistElevated(
        title: 'SYNONYM KANJI',
        children: synonymsListChildren,
      );
      listViewChildren.add(synonymsWidget);
    }

    //
    // Antonyms
    //
    var kanjiAntonyms = kanji.antonym;
    if (kanjiAntonyms != null && kanjiAntonyms.isNotEmpty) {
      List<TKXDlistCell> antonymsListChildren = [];

      for (var antonym in kanjiAntonyms) {
        var strokecountText = '';
        var strokecount = antonym.strokeCount;
        if (strokecount != null) {
          strokecountText = '$strokecount stroke${strokecount > 1 ? 's' : ''}';
        }

        antonymsListChildren.add(
          TKXDlistCell(
            onTap: () {},
            prefixIcon: Text(
              antonym.literal,
              style: theme.listCellPrefixKanjiStyle,
            ),
            title: TKXDseparatedText(
              text: antonym.meaningEn,
              seperatorColor: theme.color.labelSecondary,
            ),
            subtitle: Text(
              strokecountText,
            ),
          ),
        );
      }

      Widget antonymsWidget = TKXDlistElevated(
        title: 'ANTONYM KANJI',
        children: antonymsListChildren,
      );
      listViewChildren.add(antonymsWidget);
    }

    return TKXDscrollbar(
      child: ListView(
        children: listViewChildren,
      ),
    );
  }
}
