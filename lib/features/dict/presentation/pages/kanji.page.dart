import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/kanji.controller.dart';

class KanjiPage extends StatelessWidget {
  final String literal;
  final int id;
  const KanjiPage({Key? key, required this.literal, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kanji: $literal'),
      ),
      body: Column(
        children: [
          Text(
            literal,
            style: const TextStyle(
              fontSize: 120,
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final state = ref.watch(kanjiPageControllerProvider);
            ref.read(kanjiPageControllerProvider.notifier).init(kanjiId: id);

            return Text(state.toString());
          }),
        ],
      ),
    );
  }
}
