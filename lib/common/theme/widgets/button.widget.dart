import 'package:flutter/material.dart';

import '../theme.widget.dart';

class TKXDbuttonWidget extends StatefulWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final Color? background;

  const TKXDbuttonWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.background,
  }) : super(key: key);

  @override
  State<TKXDbuttonWidget> createState() => _TKXDButtonWidgetState();
}

class _TKXDButtonWidgetState extends State<TKXDbuttonWidget> {
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
