import 'package:flutter/widgets.dart';
import 'package:tanukiwi/common/constants/kanji.constants.dart';
import 'package:tanukiwi/common/theme/widgets/scrollbar.widget.dart';

import '../../../../common/theme/theme.widget.dart';
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
        style: theme.defaultTextStyleMedium.copyWith(
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

    return TKXDscrollbar(
      child: ListView(
        shrinkWrap: true,
        children: listViewChildren,
      ),
    );
  }
}