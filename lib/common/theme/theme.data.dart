import 'package:flutter/material.dart';
import 'package:tanukiwi/common/theme/styles/space.style.dart';

import 'styles/color.style.dart';
import 'styles/text.style.dart';

class TKXDthemeData {
  final Brightness brightness;

  TKXDthemeData({required this.brightness});

  late final bool isDark = brightness == Brightness.dark;

  // Colors
  late final TKXDcolors color = TKXDcolors(isDark: isDark);
  late final Color focusColor = color.indigo;

  // Typography
  late final TKXDtextStyles text = TKXDtextStyles(
    defaultColor: color.labelPrimary,
  );
  late final TextStyle defaultTextStyle = text.body;
  late final TextStyle defaultTextStyleMedium = text.bodyMedium;

  // Space
  double space(multiplier) => getSpace(multiplier);

  // Scroll bar
  late final Color scrollbarColor = color.labelSecondary;
  final double scrollbarThickness = 4.0;
  final double scrollbarMinThumbLength = 32.0;

  // Misc
  final double pagePaddingX = 16.0;
  final double touchHeight = 48.0;
  final double hoverTransparency = .07;
  late final Color hoverColor = color.white.withOpacity(hoverTransparency);
  final double defaultBorderWidth = 1.0;

  // App Bar
  final double appBarHeight = 64.0;
  late final Color appBarColor = color.bgPrimary;
  late final double appBarPaddingX = space(.25);
  late final double appBarTitlePaddingX = space(.375);
  final double appBarMiddleSpacing = 16.0;
  late final BorderSide appBarBorderBottom = BorderSide(
    width: .5,
    color: color.separator,
  );

  // List
  final double listViewElevatedBorderRadius = 10.0;
  final double listViewElevatedPaddingX = 16.0;

  // List Cell
  late final BorderSide listCellBorderBottom = BorderSide(
    width: .5,
    color: color.separator,
  );

  late final TextStyle listCellTitleStyle = defaultTextStyle;
  late final TextStyle listCellPrefixKanjiStyle = defaultTextStyle.copyWith(
    height: 1,
    fontSize: 32.0,
  );

  // Icon
  late final Color iconColor = color.labelSecondary;

  // Icon Button

  late final double iconButtonHeight = touchHeight;
  late final double iconButtonWidth = iconButtonHeight;

  // Button

  late final double buttonHeight = touchHeight;
  final double buttonPaddingX = 20.0;
  final double buttonBorderRadius = 14.0;
  late final TextStyle buttonDefaultTextStyle = text.subheadlineBold.copyWith(
    height: 1,
  );

  late final BoxBorder buttonOutlinedBoxBorder = Border.all(
    width: defaultBorderWidth,
    color: color.separator,
  );
  late final Color buttonOutlinedDefaultColor = color.white;
  late final double buttonOutlinedHighlightColorBlend = .12;

  // Text Field
  late final Color cursorColor = focusColor;

  // Input
  late final TextStyle hintStyle = text.body.copyWith(
    color: color.labelSecondary,
  );
}
