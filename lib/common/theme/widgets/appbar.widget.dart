import 'package:flutter/widgets.dart';

import '../theme.widget.dart';
import 'appbarToolbar.widget.dart';

class TKXDappBar extends StatelessWidget implements PreferredSizeWidget {
  const TKXDappBar({
    super.key,
    this.leading,
    this.trailing,
    this.title,
    this.centerMiddle = true,
    required this.parentContext,
  });

  final Widget? leading;

  final Widget? trailing;

  final Widget? title;

  final bool centerMiddle;

  final BuildContext parentContext;

  @override
  Size get preferredSize => Size.fromHeight(
        TKXDtheme.of(parentContext).appBarHeight,
      );

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    Widget? $title = title;
    if ($title != null) {
      $title = DefaultTextStyle(
        style: theme.defaultTextStyle,
        child: $title,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: theme.appBarColor,
        border: Border(
          bottom: theme.appBarBorderBottom,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.appBarPaddingX,
          ),
          child: TKXDappBarToolbar(
            leading: leading,
            middle: $title,
            trailing: trailing,
            middleSpacing: TKXDtheme.of(context).appBarMiddleSpacing,
            centerMiddle: centerMiddle,
          ),
        ),
      ),
    );
  }
}
