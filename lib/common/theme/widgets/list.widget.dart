import 'package:flutter/material.dart';

import '../theme.widget.dart';
import 'listCell.widget.dart';

class TKXDlist extends StatelessWidget {
  final List<TKXDlistCell> children;

  const TKXDlist({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
    );
  }
}

class TKXDlistElevated extends StatelessWidget {
  const TKXDlistElevated({
    super.key,
    required this.children,
    this.title,
    this.description,
  });

  final List<TKXDlistCell> children;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);
    final List<Widget> elevatedListChildren = [];

    children.last = children.last.copyWithNoBorder();

    // Title
    if (title != null) {
      Widget titleWidget = Padding(
        padding: EdgeInsets.fromLTRB(
          theme.listViewElevatedPaddingX,
          0,
          theme.listViewElevatedPaddingX,
          8,
        ),
        child: Text(
          title!,
          style:
              theme.text.caption1.copyWith(color: theme.color.labelSecondary),
        ),
      );
      elevatedListChildren.add(titleWidget);
    }

    // List Cells
    Widget listWidget = Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: theme.color.bgPrimaryElevated,
        borderRadius: BorderRadius.all(
            Radius.circular(theme.listViewElevatedBorderRadius)),
      ),
      child: ClipRect(
        child: Column(
          children: children,
        ),
      ),
    );
    elevatedListChildren.add(listWidget);

    // Description
    if (description != null) {
      Widget descriptionWidget = Padding(
        padding: EdgeInsets.fromLTRB(
          theme.listViewElevatedPaddingX,
          8,
          theme.listViewElevatedPaddingX,
          0,
        ),
        child: Text(
          title!,
          style:
              theme.text.caption1.copyWith(color: theme.color.labelSecondary),
        ),
      );
      elevatedListChildren.add(descriptionWidget);
    }

    return Padding(
      padding:
          EdgeInsets.fromLTRB(theme.pagePaddingX, 0, theme.pagePaddingX, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: elevatedListChildren,
      ),
    );
  }
}
