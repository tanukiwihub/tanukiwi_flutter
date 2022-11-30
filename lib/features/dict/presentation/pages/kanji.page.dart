import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/widgets/appBar.widget.dart';
import '../../../../common/theme/widgets/iconButton.widget.dart';
import '../controllers/kanji.controller.dart';
import '../controllers/kanji.state.dart';
import '../widgets/kanjiLoaded.widget.dart';

class KanjiPage extends ConsumerWidget {
  final String kanjiLiteral;
  final int kanjiId;

  const KanjiPage({Key? key, required this.kanjiLiteral, required this.kanjiId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(kanjiPageControllerProvider(kanjiId));
    final notifier = ref.watch(kanjiPageControllerProvider(kanjiId).notifier);

    Widget createBody() {
      if (state is KanjiLoaded) {
        return KanjiLoadedWidget(
          kanji: state.kanji,
        );
      } else {
        return const Text('error');
      }
    }

    return Scaffold(
      appBar: TKXDappBar(
        parentContext: context,
        leading: TKXDiconButtonWidget(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => notifier.navigateBack(context),
        ),
        title: Text('Kanji: $kanjiLiteral'),
      ),
      body: createBody(),
    );
  }
}
