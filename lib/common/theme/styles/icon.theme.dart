import 'package:flutter/material.dart';

import '../theme.widget.dart';

// Material theme and overrides
IconThemeData getIconThemeData(BuildContext context) {
  return IconThemeData(
    color: TKXDtheme.of(context).iconColor,
  );
}
