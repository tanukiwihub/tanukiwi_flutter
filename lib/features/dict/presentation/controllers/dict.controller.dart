import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'dict.state.dart';

class DictPageController extends StateNotifier<DictState> {
  DictPageController() : super(const DictInitial());

  void onSearchFieldTap(BuildContext context) {
    context.go(
      "/search",
    );
  }
}

final dictPageControllerProvider =
    StateNotifierProvider.autoDispose<DictPageController, DictState>((ref) {
  return DictPageController();
});
