import 'package:flutter/material.dart';

import '../theme.widget.dart';
import 'bottom_navigation_bar_item.widget.dart';

class TKXDbottomNavigationBar extends StatelessWidget {
  final List<TKXDbottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const TKXDbottomNavigationBar({
    Key? key,
    this.currentIndex = 0,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.bottomNavigationBarBackgroundColor,
        border: Border(
          top: theme.bottomNavigationBarTopBorderSide,
        ),
      ),
      child: SafeArea(
        maintainBottomViewPadding: false,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: theme.bottomNavigatoinBarHeight,
            minHeight: theme.bottomNavigatoinBarHeight,
          ),
          child: Row(
            children: items.map((item) {
              var index = items.indexOf(item);
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap(index),
                  child: _ItemWidget(
                    item: item,
                    isSelected: index == currentIndex,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.item,
    required this.isSelected,
  });

  final TKXDbottomNavigationBarItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTheme(
          data: IconThemeData(
            color: isSelected
                ? theme.bottomNavigationBarSelectedColor
                : theme.bottomNavigationBarColor,
          ),
          child: item.icon,
        ),
        SizedBox(
          height: theme.space(.25),
        ),
        DefaultTextStyle(
          style: theme.bottomNavigationBarTextStyle.copyWith(
            height: 1,
            color: isSelected
                ? theme.bottomNavigationBarSelectedColor
                : theme.bottomNavigationBarColor,
          ),
          child: item.title,
        ),
      ],
    );
  }
}
