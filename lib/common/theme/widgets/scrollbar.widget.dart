import 'package:flutter/widgets.dart';

import '../theme.widget.dart';

class TKXDscrollbar extends StatelessWidget {
  final Widget child;
  const TKXDscrollbar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: TKXDtheme.of(context).scrollbarColor,
      minThumbLength: TKXDtheme.of(context).scrollbarMinThumbLength,
      interactive: false,
      thickness: TKXDtheme.of(context).scrollbarThickness,
      crossAxisMargin: TKXDtheme.of(context).pagePaddingX / 2 -
          TKXDtheme.of(context).scrollbarThickness / 2,
      radius: const Radius.circular(2),
      thumbVisibility: false,
      child: child,
    );
  }
}
