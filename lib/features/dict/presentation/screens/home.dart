import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagara_app/features/dict/presentation/controllers/home.controller.dart';
import 'package:nagara_app/features/dict/presentation/controllers/home.state.dart';

class DictPage extends StatelessWidget {
  const DictPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(homeScreenControllerProvider);

          Widget body = Container();

          if (state is HomeLoaded) {
            body = SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${state.result.length.toString()} kanji'),
                  ListView.builder(
                    itemCount:
                        state.result.length < 32 ? state.result.length : 32,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int kanjiIndex) {
                      String meaningString = '';
                      String readingJaKunString = '';
                      String readingJaOnString = '';

                      for (var a in state.result[kanjiIndex].meaningEn) {
                        meaningString += a;
                        if (a != state.result[kanjiIndex].meaningEn.last) {
                          meaningString += ', ';
                        }
                      }

                      for (var a in state.result[kanjiIndex].readingJaKun) {
                        readingJaKunString += a;
                        if (a != state.result[kanjiIndex].readingJaKun.last) {
                          readingJaKunString += ', ';
                        }
                      }

                      for (var a in state.result[kanjiIndex].readingJaOn) {
                        readingJaOnString += a;
                        if (a != state.result[kanjiIndex].readingJaOn.last) {
                          readingJaOnString += ', ';
                        }
                      }

                      return ListTile(
                        title: Text(
                          state.result[kanjiIndex].literal,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meaningString,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: readingJaKunString,
                                  ),
                                  TextSpan(
                                    text: readingJaKunString != '' &&
                                            readingJaOnString != ''
                                        ? ' • '
                                        : '',
                                  ),
                                  TextSpan(
                                    text: readingJaOnString,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is HomeError) {
            print('error');
          }

          return Scaffold(
            appBar: AppBar(
              title: TextField(
                onChanged: (value) async {
                  if (value.isNotEmpty) {
                    await ref
                        .read(homeScreenControllerProvider.notifier)
                        .searchKanji(value);
                  }
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  suffixIcon: Icon(Icons.cancel_outlined),
                ),
              ),
            ),
            body: body,
          );
        },
      );
}
