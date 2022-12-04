import 'package:flutter/widgets.dart';

class TKXDseparatedText extends StatelessWidget {
  const TKXDseparatedText({
    super.key,
    required this.text,
    this.separator = ";",
    this.seperatorColor,
    this.style,
  });

  final List<String> text;
  final String? separator;
  final Color? seperatorColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textChildren = [];

    for (var a in text) {
      textChildren.add(TextSpan(
        text: a,
      ));
      if (a != text.last) {
        textChildren.add(TextSpan(
          text: '$separator ',
          style: TextStyle(color: seperatorColor),
        ));
      }
    }

    return Text.rich(
      TextSpan(
        children: textChildren,
      ),
      style: style,
    );
  }
}
