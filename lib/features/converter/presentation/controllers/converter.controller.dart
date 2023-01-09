import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanukiwi/features/converter/domain/services/converter.service.dart';

import 'converter.state.dart';

class ConverterPageController extends StateNotifier<ConverterState> {
  final ConverterService converterService;

  final TextEditingController inputController = TextEditingController();
  final FocusNode inputFocusNode = FocusNode();

  ConverterPageController(
    this.converterService,
  ) : super(const ConverterInitial()) {
    _onInit();
  }

  String _lastInput = '';

  Future<bool> hasClipboardString() async {
    return await Clipboard.hasStrings();
  }

  void _onInit() {
    inputController.addListener(_onInputChange);
    inputFocusNode.addListener(_onInputFocusChange);
  }

  void _onInputFocusChange() {
    if (inputController.text.isEmpty) {
      if (inputFocusNode.hasFocus) {
        state = const ConverterActive();
      } else {
        state = const ConverterInitial();
      }
    }
  }

  void _onInputChange() {
    // Check if the input text has changed since last change
    // Return to prevent unnecessary execution
    if (_lastInput == inputController.text) return;
    _lastInput = inputController.text;

    if (inputController.text.isEmpty) {
      if (inputFocusNode.hasFocus) {
        state = const ConverterActive();
      } else {
        state = const ConverterInitial();
      }
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
    }
  }

  void onInputSizedBoxTap() {
    if (!inputFocusNode.hasFocus) {
      inputFocusNode.requestFocus();
    }
  }

  void onInputClearTap(BuildContext context) {
    if (inputController.text.isEmpty) {
      FocusScope.of(context).requestFocus(FocusNode());
    } else {
      inputController.clear();
    }
  }
}

final converterPageControllerProvider =
    StateNotifierProvider.autoDispose<ConverterPageController, ConverterState>(
        (ref) {
  return ConverterPageController(
    ref.watch(converterServiceProvider),
  );
});
