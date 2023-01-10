import 'package:flutter/material.dart';

class TKXDtextStyles {
  final String fontFamily;
  final Color defaultColor;

  TKXDtextStyles({
    this.fontFamily = 'NotoSansJP',
    required this.defaultColor,
  });

  late final TextStyle body = TextStyle(
    fontFamily: fontFamily,
    color: defaultColor,
    fontSize: 17.0,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );
  late final TextStyle bodyMedium = body.copyWith(
    fontWeight: FontWeight.w500,
  );
  late final TextStyle bodyBold = body.copyWith(
    fontWeight: FontWeight.w700,
  );

  late final TextStyle subheadline = TextStyle(
    fontFamily: fontFamily,
    color: defaultColor,
    fontSize: 15.0,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );
  late final TextStyle subheadlineBold = subheadline.copyWith(
    fontWeight: FontWeight.w700,
  );

  late final TextStyle caption1 = TextStyle(
    fontFamily: fontFamily,
    color: defaultColor,
    fontSize: 12.0,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );
  late final TextStyle caption1Bold = caption1.copyWith(
    fontWeight: FontWeight.w700,
  );

  late final TextStyle caption2 = TextStyle(
    fontFamily: fontFamily,
    color: defaultColor,
    fontSize: 11.0,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );
  late final TextStyle caption2Bold = caption2.copyWith(
    fontWeight: FontWeight.w700,
  );
}
