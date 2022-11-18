import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagara_app/features/dict/presentation/controllers/kanji.state.dart';

import '../controllers/kanji.controller.dart';

class KanjiPage extends StatelessWidget {
  final String kanjiLiteral;
  final int kanjiId;
  const KanjiPage({Key? key, required this.kanjiLiteral, required this.kanjiId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kanji: $kanjiLiteral'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              kanjiLiteral,
              style: const TextStyle(
                fontSize: 120,
              ),
            ),
            Consumer(builder: (context, ref, child) {
              final state = ref.watch(kanjiPageControllerProvider(kanjiId));

              if (state is KanjiLoaded) {
                return Text(
                  state.kanji.toString(),
                );
              } else {
                return const Text('error');
              }
            }),
          ],
        ),
      ),
    );
  }
}
