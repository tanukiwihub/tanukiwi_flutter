import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaformBrightnessServiceNotifier extends StateNotifier<Brightness>
    with WidgetsBindingObserver {
  PlaformBrightnessServiceNotifier()
      : super(WidgetsBinding.instance.platformDispatcher.platformBrightness) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    state = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    super.didChangePlatformBrightness();
  }
}

final platormBrignthessServiceProvider =
    StateNotifierProvider<PlaformBrightnessServiceNotifier, Brightness>((ref) {
  return PlaformBrightnessServiceNotifier();
});
