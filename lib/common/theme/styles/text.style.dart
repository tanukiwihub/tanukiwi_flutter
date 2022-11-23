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
  late final TextStyle bodyBold = body.copyWith(
    fontWeight: FontWeight.w700,
  );
}
