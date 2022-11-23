import 'package:flutter/material.dart';
import 'package:tanukiwi/common/theme/styles/space.style.dart';

import 'styles/color.style.dart';
import 'styles/text.style.dart';

class TKXDthemeData {
  final bool isDark;

  TKXDthemeData({required this.isDark});

  // Colors
  late final TKXDcolors color = TKXDcolors(isDark: isDark);

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
}
