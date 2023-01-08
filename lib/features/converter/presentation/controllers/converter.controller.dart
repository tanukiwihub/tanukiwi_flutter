import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanukiwi/features/converter/domain/services/converter.service.dart';

import 'converter.state.dart';

class ConverterPageController extends StateNotifier<ConverterState> {
  final ConverterService converterService;

  final TextEditingController inputController = TextEditingController();

  final ClipboardStatusNotifier clipboardStatusNotifier =
      ClipboardStatusNotifier();

  ConverterPageController(
    this.converterService,
  ) : super(ConverterInitial(hasClipboardString: _hasClipboardString())) {
    _onInit();
  }

  String _lastInput = '';

  static Future<bool> _hasClipboardString() async {
    return await Clipboard.hasStrings();
  }

  void _onInit() {
    inputController.addListener(_onInputChange);
    clipboardStatusNotifier.addListener(_onClipboardStatusChange);
  }

  // Rebuild the initial widgets if the clipboard status has changed,
  // so that the paste button is only shown when a string is in clipboard
  Future<void> _onClipboardStatusChange() async {
    if (state is ConverterInitial) {
      state = ConverterInitial(hasClipboardString: _hasClipboardString());
    }
  }

  void _onInputChange() {
    // Check if the input text has changed since last change
    // Return to prevent unnecessary execution
    if (_lastInput == inputController.text) return;
    _lastInput = inputController.text;

    if (inputController.text.isEmpty) {
      state = ConverterInitial(hasClipboardString: _hasClipboardString());
    } else {
      final morphResult = converterService.getMorphs(inputController.text);
      morphResult.fold(
        (l) {
          state = const ConverterError();
        },
        (r) {
          state = ConverterLoaded(morphTokens: r);
        },
      );
    }
  }

  Future<void> onPasteTap() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      String? text = clipboardData.text;
      if (text != null && text.isNotEmpty) {
        final updatedText = inputController.text + text;
        inputController.value = TextEditingValue(
          text: updatedText,
          selection: TextSelection.collapsed(offset: updatedText.length),
        );
      }
    } else {}
  }

  void onInputClearTap() {
    inputController.clear();
  }
}

final converterPageControllerProvider =
    StateNotifierProvider.autoDispose<ConverterPageController, ConverterState>(
        (ref) {
  return ConverterPageController(
    ref.watch(converterServiceProvider),
  );
});
