import 'package:flutter/material.dart';

import '../theme.widget.dart';

// Material theme and overrides
InputDecorationTheme getInputDecorationTheme(BuildContext context) {
  return InputDecorationTheme(
    hintStyle: TKXDtheme.of(context).hintStyle,
  );
}
