import 'package:flutter/material.dart';
import 'package:tanukiwi/common/theme/styles/space.style.dart';

import 'styles/color.style.dart';
import 'styles/text.style.dart';

class TKXDthemeData {
  final bool isDark;

  TKXDthemeData({required this.isDark});

  // Colors
  late final TKXDcolors color = TKXDcolors(isDark: isDark);
  late final Color focusColor = color.indigo;

  // Typography
  late final TKXDtextStyles text = TKXDtextStyles(
    defaultColor: color.labelPrimary,
  );
  late final TextStyle defaultTextStyle = text.body;

  // Space
  double space(multiplier) => getSpace(multiplier);

  // Misc
  final double pagePaddingX = 16.0;
  final double touchHeight = 48.0;

  // App Bar

  final double appBarHeight = 64.0;
  late final Color appBarColor = color.bgPrimary;
  late final double appBarPaddingX = space(.25);
  late final double appBarTitlePaddingX = space(.375);
  late final BorderSide appBarBorderBottom = BorderSide(
    width: .5,
    color: color.separator,
  );

  // Text Field
  late final Color cursorColor = focusColor;

  // Input

  late final TextStyle hintStyle = text.body.copyWith(
    color: color.labelSecondary,
  );
}
