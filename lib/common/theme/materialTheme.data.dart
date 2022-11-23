import 'package:flutter/material.dart';

import 'theme.widget.dart';

// Material theme and overrides
ThemeData getTKXDmaterialTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: TKXDtheme.of(context).color.bgPrimary,
  );
}
