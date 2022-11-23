import 'package:flutter/material.dart';

class TKXDcolors {
  final bool isDark;

  TKXDcolors({
    required this.isDark,
  });

  // Label
  late final labelPrimary = const Color.fromRGBO(255, 255, 255, 1);
  late final labelSecondary = const Color.fromRGBO(240, 240, 245, .6);
  static const labelTertiary = Color.fromRGBO(240, 240, 245, .3);
  static const labelQuarternary = Color.fromRGBO(255, 255, 255, .18);

  // Background
  late final Color bgPrimary = isDark
      ? const Color.fromRGBO(8, 8, 12, 1)
      : const Color.fromRGBO(255, 255, 255, 1);

  static const bgPrimaryElevated = Color.fromRGBO(32, 32, 37, 1);

  // Separator
  static const separator = Color.fromRGBO(60, 60, 64, 1);
  static const separatorTransparent = Color.fromRGBO(90, 90, 93, .65);
  // Fill
  static const fillPrimary = Color.fromRGBO(125, 125, 128, .36);
  late final fillSecondary = const Color.fromRGBO(125, 125, 128, .32);
  static const fillTertiary = Color.fromRGBO(122, 123, 125, .24);
  static const fillQuarternary = Color.fromRGBO(120, 120, 122, .18);
  // System
  static const blue = Color.fromRGBO(75, 141, 247, 1);
  static const indigo = Color.fromRGBO(92, 107, 192, 1);
  // Highlight
  static const highlightGray = Color.fromRGBO(191, 193, 200, 1);
  static const highlightRed = Color.fromRGBO(239, 135, 143, 1);
  static const highlightOrange = Color.fromRGBO(243, 177, 126, 1);
  static const highlightGreen = Color.fromRGBO(170, 238, 177, 1);
  static const highlightBlue = Color.fromRGBO(145, 188, 149, 1);
  static const highlightPurple = Color.fromRGBO(179, 154, 134, 1);
  // HighlightBG
  static const highlightBgGray = Color.fromRGBO(51, 52, 57, 1);
  static const highlightBgRed = Color.fromRGBO(63, 37, 43, 1);
  static const highlightBgOrange = Color.fromRGBO(64, 48, 39, 1);
  static const highlightBgGreen = Color.fromRGBO(46, 63, 52, 1);
  static const highlightBgBlue = Color.fromRGBO(40, 51, 70, 1);
  static const highlightBgPurple = Color.fromRGBO(48, 42, 66, 1);
}
