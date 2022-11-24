import 'package:flutter/material.dart';
import 'package:tanukiwi/common/theme/styles/icon.theme.dart';

import 'theme.widget.dart';

// Material theme and overrides
ThemeData getTKXDmaterialTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: TKXDtheme.of(context).color.bgPrimary,
    brightness:
        TKXDtheme.of(context).isDark ? Brightness.dark : Brightness.light,
    splashFactory: NoSplash.splashFactory,
    iconTheme: getIconThemeData(context),
  );
}
