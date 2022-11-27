// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tanukiwi/common/theme/theme.widget.dart';

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

class TKXDlistCell extends StatefulWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? prefixIcon;
  final Widget? suffix;
  final VoidCallback? onTap;

  const TKXDlistCell({
    Key? key,
    required this.title,
    this.subtitle,
    this.prefixIcon,
    this.suffix,
    this.onTap,
  }) : super(key: key);

  @override
  State<TKXDlistCell> createState() => _TKXDlistCellState();
}

class _TKXDlistCellState extends State<TKXDlistCell> {
  bool isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (value) {
        setState(() {
          isTapDown = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapDown = false;
        });
      },
      child: Container(
        color:
            isTapDown ? TKXDtheme.of(context).hoverColor : Colors.transparent,
        padding: EdgeInsets.only(
          left: TKXDtheme.of(context).pagePaddingX,
        ),
        child: Row(
          children: [
            // Prefix Icon
            widget.prefixIcon != null
                ? Container(
                    padding: EdgeInsets.only(
                      right: TKXDtheme.of(context).space(1.0),
                    ),
                    child: widget.prefixIcon,
                  )
                : Container(),
            // Content
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: TKXDtheme.of(context).appBarBorderBottom,
                  ),
                ),
                child: Row(
                  children: [
                    // Left Content
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: TKXDtheme.of(context).space(.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TKXDtheme.of(context).defaultTextStyle,
                              child: widget.title,
                            ),
                            DefaultTextStyle(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TKXDtheme.of(context).text.caption1.copyWith(
                                        color: TKXDtheme.of(context)
                                            .color
                                            .labelSecondary,
                                      ),
                              child: Container(
                                child: widget.subtitle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Right Content
                    Padding(
                      padding: EdgeInsets.only(
                        right: TKXDtheme.of(context).pagePaddingX,
                      ),
                      child: Row(
                        children: [
                          Container(child: widget.suffix),
                          Padding(
                            padding: EdgeInsets.only(
                              left: TKXDtheme.of(context).space(.75),
                            ),
                            child: Icon(
                              Icons.chevron_right,
                              color: TKXDtheme.of(context).color.labelTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
