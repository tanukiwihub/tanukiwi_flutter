import 'package:flutter/material.dart';

class TKXDcolors {
  final bool isDark;

  TKXDcolors({
    required this.isDark,
  });

  // Ref
  late final white = const Color.fromRGBO(255, 255, 255, 1);

  // Label
  late final labelPrimary = const Color.fromRGBO(255, 255, 255, 1);
  late final labelSecondary = const Color.fromRGBO(240, 240, 245, .6);
  late final labelTertiary = const Color.fromRGBO(240, 240, 245, .3);
  late final labelQuarternary = const Color.fromRGBO(255, 255, 255, .18);

  // Background
  late final Color bgPrimary = isDark
      ? const Color.fromRGBO(8, 8, 12, 1)
      : const Color.fromRGBO(255, 255, 255, 1);

  late final Color bgPrimaryElevated = const Color.fromRGBO(32, 32, 37, 1);

  // Separator
  late final Color separator = const Color.fromRGBO(60, 60, 64, 1);
  late final Color separatorTransparent = const Color.fromRGBO(90, 90, 93, .65);
  // Fill
  late final fillPrimary = const Color.fromRGBO(125, 125, 128, .36);
  late final fillSecondary = const Color.fromRGBO(125, 125, 128, .32);
  late final fillTertiary = const Color.fromRGBO(122, 123, 125, .24);
  late final fillQuarternary = const Color.fromRGBO(120, 120, 122, .18);
  // System
  late final blue = const Color.fromRGBO(75, 141, 247, 1);
  late final indigo = const Color.fromRGBO(92, 107, 192, 1);
  // Highlight
  late final highlightGray = const Color.fromRGBO(191, 193, 200, 1);
  late final highlightRed = const Color.fromRGBO(239, 135, 143, 1);
  late final highlightOrange = const Color.fromRGBO(243, 177, 126, 1);
  late final highlightGreen = const Color.fromRGBO(170, 238, 177, 1);
  late final highlightBlue = const Color.fromRGBO(145, 188, 249, 1);
  late final highlightPurple = const Color.fromRGBO(179, 154, 234, 1);
  // HighlightBG
  late final highlightBgGray = const Color.fromRGBO(51, 52, 57, 1);
  late final highlightBgRed = const Color.fromRGBO(63, 37, 43, 1);
  late final highlightBgOrange = const Color.fromRGBO(64, 48, 39, 1);
  late final highlightBgGreen = const Color.fromRGBO(46, 63, 52, 1);
  late final highlightBgBlue = const Color.fromRGBO(40, 51, 70, 1);
  late final highlightBgPurple = const Color.fromRGBO(48, 42, 66, 1);
}
