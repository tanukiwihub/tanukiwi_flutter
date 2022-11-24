import 'package:flutter/material.dart';

import '../theme.widget.dart';

class TKXDiconButtonWidget extends StatefulWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final Color? background;

  const TKXDiconButtonWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.background,
  }) : super(key: key);

  @override
  State<TKXDiconButtonWidget> createState() => _TKXDiconButtonWidgetState();
}

class _TKXDiconButtonWidgetState extends State<TKXDiconButtonWidget> {
  bool isTapDown = false;
  @override
  Widget build(BuildContext context) {
    Color background = widget.background ?? Colors.transparent;
    Color backgroundHover = widget.background != null
        ? Color.alphaBlend(
            TKXDtheme.of(context).color.white.withOpacity(.07),
            background,
          )
        : TKXDtheme.of(context).hoverColor;

    return SizedBox(
      height: TKXDtheme.of(context).touchHeight,
      width: TKXDtheme.of(context).touchHeight,
      child: Padding(
        padding: EdgeInsets.all(
          TKXDtheme.of(context).space(.25),
        ),
        child: InkWell(
          onTap: widget.onPressed,
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isTapDown ? backgroundHover : background,
            ),
            alignment: Alignment.center,
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}
