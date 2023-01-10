import 'package:flutter/material.dart';

import '../theme.widget.dart';

class TKXDdivider extends StatelessWidget {
  const TKXDdivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    return Container(
      height: theme.dividerHeight,
      color: theme.color.separator,
    );
  }
}
