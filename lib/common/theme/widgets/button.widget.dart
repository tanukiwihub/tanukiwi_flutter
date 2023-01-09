import 'package:flutter/material.dart';

import '../theme.widget.dart';

class TKXDoutlineButton extends TKXDbuttonStyleButton {
  const TKXDoutlineButton({
    Key? key,
    required super.onPressed,
    required super.child,
    super.color,
  }) : super(
          key: key,
        );

  @override
  TKXDbuttonStyle style(BuildContext context) {
    final theme = TKXDtheme.of(context);
    return TKXDbuttonStyle(
        border: theme.buttonOutlinedBoxBorder,
        color: color ?? theme.buttonOutlinedDefaultColor,
        highlightColor: Color.alphaBlend(
          (color ?? theme.buttonOutlinedDefaultColor)
              .withOpacity(theme.buttonOutlinedHighlightColorBlend),
          theme.color.bgPrimary,
        ));
  }
}

abstract class TKXDbuttonStyleButton extends StatefulWidget {
  final Icon? icon;
  final VoidCallback onPressed;
  final Color? color;
  final Widget child;

  const TKXDbuttonStyleButton({
    Key? key,
    this.icon,
    required this.onPressed,
    required this.child,
    this.color,
  }) : super(key: key);

  @protected
  TKXDbuttonStyle style(BuildContext context);

  @override
  State<TKXDbuttonStyleButton> createState() => _TKXDButtonStyleButtonState();
}

class _TKXDButtonStyleButtonState extends State<TKXDbuttonStyleButton> {
  @override
  Widget build(BuildContext context) {
    final style = widget.style(context);
    final theme = TKXDtheme.of(context);

    return InkWell(
      highlightColor: style.highlightColor,
      borderRadius: BorderRadius.all(
        Radius.circular(
          theme.buttonBorderRadius,
        ),
      ),
      onTap: widget.onPressed,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minHeight: theme.buttonHeight,
          maxHeight: theme.buttonHeight,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: theme.buttonPaddingX,
        ),
        decoration: BoxDecoration(
          border: style.border,
          borderRadius: BorderRadius.all(
            Radius.circular(
              theme.buttonBorderRadius,
            ),
          ),
        ),
        child: DefaultTextStyle(
          style: theme.buttonDefaultTextStyle.copyWith(
            color: style.color,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

@immutable
class TKXDbuttonStyle {
  final BoxBorder? border;
  final Color highlightColor;
  final Color color;

  const TKXDbuttonStyle({
    this.border,
    required this.highlightColor,
    required this.color,
  });
}
