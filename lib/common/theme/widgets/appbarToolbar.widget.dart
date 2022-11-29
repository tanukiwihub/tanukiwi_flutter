import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class TKXDappBarToolbar extends StatelessWidget {
  /// Creates a widget that lays out its children in a manner suitable for a
  /// toolbar.
  const TKXDappBarToolbar({
    super.key,
    this.leading,
    this.middle,
    this.trailing,
    this.centerMiddle = true,
    required this.middleSpacing,
  });

  /// Widget to place at the start of the horizontal toolbar.
  final Widget? leading;

  /// Widget to place in the middle of the horizontal toolbar, occupying
  /// as much remaining space as possible.
  final Widget? middle;

  /// Widget to place at the end of the horizontal toolbar.
  final Widget? trailing;

  /// Whether to align the [middle] widget to the center of this widget or
  /// next to the [leading] widget when false.
  final bool centerMiddle;

  /// The spacing around the [middle] widget on horizontal axis.
  final double middleSpacing;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasDirectionality(context));
    final TextDirection textDirection = Directionality.of(context);
    return CustomMultiChildLayout(
      delegate: _ToolbarLayout(
        centerMiddle: centerMiddle,
        middleSpacing: middleSpacing,
        textDirection: textDirection,
      ),
      children: <Widget>[
        if (leading != null)
          LayoutId(id: _ToolbarSlot.leading, child: leading!),
        if (middle != null) LayoutId(id: _ToolbarSlot.middle, child: middle!),
        if (trailing != null)
          LayoutId(id: _ToolbarSlot.trailing, child: trailing!),
      ],
    );
  }
}

enum _ToolbarSlot {
  leading,
  middle,
  trailing,
}

class _ToolbarLayout extends MultiChildLayoutDelegate {
  _ToolbarLayout({
    required this.centerMiddle,
    required this.middleSpacing,
    required this.textDirection,
  });

  // If false the middle widget should be start-justified within the space
  // between the leading and trailing widgets.
  // If true the middle widget is centered within the toolbar (not within the horizontal
  // space between the leading and trailing widgets).
  final bool centerMiddle;

  /// The spacing around middle widget on horizontal axis.
  final double middleSpacing;

  final TextDirection textDirection;

  @override
  void performLayout(Size size) {
    double leadingWidth = 0.0;
    double trailingWidth = 0.0;

    if (hasChild(_ToolbarSlot.leading)) {
      final BoxConstraints constraints = BoxConstraints(
        maxWidth: size.width /
            3.0, // The leading widget shouldn't take up more than 1/3 of the space.
        minHeight:
            size.height, // The height should be exactly the height of the bar.
        maxHeight: size.height,
      );
      leadingWidth = layoutChild(_ToolbarSlot.leading, constraints).width;
      final double leadingX;
      switch (textDirection) {
        case TextDirection.rtl:
          leadingX = size.width - leadingWidth;
          break;
        case TextDirection.ltr:
          leadingX = 0.0;
          break;
      }
      positionChild(_ToolbarSlot.leading, Offset(leadingX, 0.0));
    }

    if (hasChild(_ToolbarSlot.trailing)) {
      final BoxConstraints constraints = BoxConstraints.loose(size);
      final Size trailingSize = layoutChild(_ToolbarSlot.trailing, constraints);
      final double trailingX;
      switch (textDirection) {
        case TextDirection.rtl:
          trailingX = 0.0;
          break;
        case TextDirection.ltr:
          trailingX = size.width - trailingSize.width;
          break;
      }
      final double trailingY = (size.height - trailingSize.height) / 2.0;
      trailingWidth = trailingSize.width;
      positionChild(_ToolbarSlot.trailing, Offset(trailingX, trailingY));
    }

    if (hasChild(_ToolbarSlot.middle)) {
      final double maxWidth = math.max(
          size.width - leadingWidth - trailingWidth - middleSpacing * 2.0, 0.0);
      final BoxConstraints constraints =
          BoxConstraints.loose(size).copyWith(maxWidth: maxWidth);
      final Size middleSize = layoutChild(_ToolbarSlot.middle, constraints);

      final double middleStartMargin = leadingWidth + middleSpacing;
      double middleStart = middleStartMargin;
      final double middleY = (size.height - middleSize.height) / 2.0;
      // If the centered middle will not fit between the leading and trailing
      // widgets, then align its left or right edge with the adjacent boundary.
      if (centerMiddle) {
        middleStart = (size.width - middleSize.width) / 2.0;
        if (middleStart + middleSize.width > size.width - trailingWidth) {
          middleStart = size.width - trailingWidth - middleSize.width;
        } else if (middleStart < middleStartMargin) {
          middleStart = middleStartMargin;
        }
      }

      final double middleX;
      switch (textDirection) {
        case TextDirection.rtl:
          middleX = size.width - middleSize.width - middleStart;
          break;
        case TextDirection.ltr:
          middleX = middleStart;
          break;
      }

      positionChild(_ToolbarSlot.middle, Offset(middleX, middleY));
    }
  }

  @override
  bool shouldRelayout(_ToolbarLayout oldDelegate) {
    return oldDelegate.centerMiddle != centerMiddle ||
        oldDelegate.middleSpacing != middleSpacing ||
        oldDelegate.textDirection != textDirection;
  }
}
