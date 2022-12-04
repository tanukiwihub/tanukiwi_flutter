import 'package:flutter/material.dart';

import '../theme.widget.dart';

class TKXDlistCell extends StatefulWidget {
  const TKXDlistCell({
    super.key,
    required this.title,
    this.subtitle,
    this.prefixIcon,
    this.suffix,
    this.onTap,
    this.titleMultiline = false,
    this.hasBottomBorder = true,
  });

  final Widget title;
  final bool titleMultiline;
  final bool hasBottomBorder;
  final Widget? subtitle;
  final Widget? prefixIcon;
  final Widget? suffix;
  final VoidCallback? onTap;

  TKXDlistCell copyWithNoBorder() {
    return TKXDlistCell(
      title: title,
      titleMultiline: titleMultiline,
      hasBottomBorder: false,
      subtitle: subtitle,
      prefixIcon: prefixIcon,
      suffix: suffix,
      onTap: onTap,
    );
  }

  @override
  State<TKXDlistCell> createState() => _TKXDlistCellState();
}

class _TKXDlistCellState extends State<TKXDlistCell> {
  bool isPanDown = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> cellRowChildren = [];
    List<Widget> rightContentenChildren = [];

    Color hoverColor = Colors.transparent;

    BorderSide bottomBorder = widget.hasBottomBorder
        ? TKXDtheme.of(context).listCellBorderBottom
        : BorderSide.none;

    bool hasChevron = false;

    dynamic titleMultiline = widget.titleMultiline ? null : 1;

    TextOverflow titleOverflow =
        widget.titleMultiline ? TextOverflow.visible : TextOverflow.ellipsis;

    if (widget.onTap != null) {
      hoverColor =
          isPanDown ? TKXDtheme.of(context).hoverColor : Colors.transparent;
      hasChevron = true;
    }

    //
    // Left Content
    //
    Widget leftContent = Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: TKXDtheme.of(context).space(.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
              maxLines: titleMultiline,
              overflow: titleOverflow,
              style: TKXDtheme.of(context).defaultTextStyle,
              child: widget.title,
            ),
            DefaultTextStyle(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TKXDtheme.of(context).text.caption1.copyWith(
                    color: TKXDtheme.of(context).color.labelSecondary,
                  ),
              child: Container(
                child: widget.subtitle,
              ),
            )
          ],
        ),
      ),
    );

    //
    // Right Content
    //
    if (widget.suffix != null) {
      rightContentenChildren.add(widget.suffix!);
    }

    if (hasChevron) {
      Widget chevron = Padding(
        padding: EdgeInsets.only(
          left: TKXDtheme.of(context).space(.75),
        ),
        child: Icon(
          Icons.chevron_right,
          color: TKXDtheme.of(context).color.labelTertiary,
        ),
      );
      rightContentenChildren.add(chevron);
    }

    Widget rightContent = Padding(
      padding: EdgeInsets.only(
        right: TKXDtheme.of(context).pagePaddingX,
      ),
      child: Row(
        children: rightContentenChildren,
      ),
    );

    // Prefix Icon
    if (widget.prefixIcon != null) {
      Widget prefixIconWidget = Container(
        padding: EdgeInsets.only(
          right: TKXDtheme.of(context).space(1.0),
        ),
        child: widget.prefixIcon,
      );
      cellRowChildren.add(prefixIconWidget);
    }

    //
    // Content wrapper
    //
    Widget content = Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: bottomBorder,
          ),
        ),
        child: Row(
          children: [
            leftContent,
            rightContent,
          ],
        ),
      ),
    );
    cellRowChildren.add(content);

    return GestureDetector(
      onTap: widget.onTap,
      onPanDown: (value) {
        setState(() {
          isPanDown = true;
        });
      },
      onPanEnd: (value) {
        setState(() {
          isPanDown = false;
        });
      },
      onPanCancel: () {
        setState(() {
          isPanDown = false;
        });
      },
      child: Container(
        color: hoverColor,
        padding: EdgeInsets.only(
          left: TKXDtheme.of(context).pagePaddingX,
        ),
        child: Row(
          children: cellRowChildren,
        ),
      ),
    );
  }
}
