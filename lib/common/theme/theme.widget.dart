import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/platformBrightness.service.dart';
import 'theme.data.dart';

class TKXDtheme extends StatelessWidget {
  final Widget child;

  const TKXDtheme({
    super.key,
    required this.child,
  });

  static TKXDthemeData of(BuildContext context) {
    final _InheritedTKXDtheme? result =
        context.dependOnInheritedWidgetOfExactType<_InheritedTKXDtheme>();
    assert(result != null, 'No TKXD theme data found in context');
    return result!.themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, consumerChild) {
      final TKXDthemeData themeData = TKXDthemeData(
        brightness: ref.watch(platormBrignthessServiceProvider),
      );

      return _InheritedTKXDtheme(
        themeData: themeData,
        child: child,
      );
    }));
  }
}

class _InheritedTKXDtheme extends InheritedWidget {
  const _InheritedTKXDtheme({
    required this.themeData,
    required super.child,
  });

  final TKXDthemeData themeData;

  @override
  bool updateShouldNotify(_InheritedTKXDtheme oldWidget) =>
      themeData != oldWidget.themeData;
}
