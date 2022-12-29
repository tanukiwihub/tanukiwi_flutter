import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'converter.state.dart';

class ConverterPageController extends StateNotifier<ConverterState> {
  ConverterPageController() : super(const ConverterInitial());
}

final converterPageControllerProvider =
    StateNotifierProvider.autoDispose<ConverterPageController, ConverterState>(
        (ref) {
  return ConverterPageController();
});
