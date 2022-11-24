import 'package:flutter/material.dart';

import '../theme.widget.dart';

class TKXDappBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final Widget? title;
  final BuildContext parentContext;

  const TKXDappBar({
    Key? key,
    this.leadingIcon,
    this.suffixIcon,
    this.title,
    required this.parentContext,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
        TKXDtheme.of(parentContext).appBarHeight,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TKXDtheme.of(context).appBarColor,
        border: Border(
          bottom: TKXDtheme.of(context).appBarBorderBottom,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TKXDtheme.of(context).appBarPaddingX,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: leadingIcon,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: TKXDtheme.of(context).appBarPaddingX,
                    ),
                    alignment: Alignment.center,
                    child: title,
                  ),
                ),
                Container(
                  child: suffixIcon,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
