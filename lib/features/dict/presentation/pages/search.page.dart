import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/search.controller.dart';
import '../controllers/search.state.dart';
import '../widgets/searchLoaded.widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(searchPageControllerProvider);

          Widget body = Container();

          if (state is SearchLoaded) {
            body = SearchLoadedWidget(kanji: state.kanji);
          } else if (state is SearchError) {
            debugPrint('error');
          } else if (state is SearchInitial) {
            body = const Text('initial');
          } else if (state is SearchActive) {
            body = const Text('active');
          } else if (state is SearchLoading) {
          } else {
            body = const Text('error');
          }

          return Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: ref
                    .read(searchPageControllerProvider.notifier)
                    .searchFieldController,
                focusNode: ref
                    .read(searchPageControllerProvider.notifier)
                    .searchFieldFocus,
                decoration: InputDecoration(
                  prefixIcon: state is SearchInitial
                      ? const Icon(Icons.search)
                      : IconButton(
                          onPressed: ref
                              .read(searchPageControllerProvider.notifier)
                              .cancelSearch,
                          icon: const Icon(Icons.arrow_back),
                        ),
                  suffixIcon: ref
                          .read(searchPageControllerProvider.notifier)
                          .searchFieldController
                          .text
                          .isNotEmpty
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
