import 'package:flutter/widgets.dart';
import 'package:tanukiwi/common/theme/theme.widget.dart';

class TKXDtag extends StatelessWidget {
  const TKXDtag({
    super.key,
    this.background,
    this.color,
    required this.label,
  });

  final Color? background;
  final Color? color;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    final $background = background ?? theme.color.highlightBgGray;
    final $color = color ?? theme.color.highlightGray;

    const double paddingY = 12.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingY),
      decoration: BoxDecoration(
        color: $background,
        borderRadius: BorderRadius.all(Radius.circular(paddingY)),
      ),
      child: Text(
        label,
        style: theme.text.subheadline.copyWith(color: $color),
      ),
    );
  }
}
