import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagara_app/features/dict/presentation/controllers/search.controller.dart';
import 'package:nagara_app/features/dict/presentation/controllers/search.state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(searchPageControllerProvider);

          Widget body = Container();

          if (state is SearchLoaded) {
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
          } else if (state is SearchError) {
            print('error');
          } else if (state is SearchInitial) {
            body = const Text('initial');
          } else if (state is SearchActive) {
            body = const Text('active');
          } else {
            body = const Text('error');
          }

          return Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: searchFieldController,
                focusNode: searchFieldFocus,
                decoration: InputDecoration(
                  prefixIcon: state is SearchInitial
                      ? const Icon(Icons.search)
                      : IconButton(
                          onPressed: ref
                              .read(searchPageControllerProvider.notifier)
                              .cancelSearch,
                          icon: const Icon(Icons.arrow_back),
                        ),
                  suffixIcon: searchFieldController.text.isNotEmpty
                      ? IconButton(
                          onPressed: ref
                              .read(searchPageControllerProvider.notifier)
                              .clearSearch,
                          icon: const Icon(Icons.cancel),
                        )
                      : null,
                ),
              ),
            ),
            body: GestureDetector(
              onTap: () {
                // Hide keyboard when clicking outside app bar
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: body,
            ),
          );
        },
      );
}
