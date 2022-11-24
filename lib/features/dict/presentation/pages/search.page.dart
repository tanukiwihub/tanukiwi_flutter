import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanukiwi/common/theme/theme.widget.dart';
import 'package:tanukiwi/common/theme/widgets/appBar.widget.dart';

import '../../../../common/theme/widgets/iconButton.widget.dart';
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
          } else if (state is SearchInitial) {
            body = const Text('initial');
          } else {
            body = const Text('error');
          }

          return Scaffold(
            appBar: TKXDappBar(
              parentContext: context,
              leadingIcon: TKXDiconButtonWidget(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => ref
                    .read(searchPageControllerProvider.notifier)
                    .navigateBack(context),
              ),
              title: TextField(
                style: TKXDtheme.of(context).defaultTextStyle,
                cursorColor: TKXDtheme.of(context).cursorColor,
                autofocus: true,
                controller: ref
                    .read(searchPageControllerProvider.notifier)
                    .searchFieldController,
                focusNode: ref
                    .read(searchPageControllerProvider.notifier)
                    .searchFieldFocus,
                decoration: InputDecoration(
                  suffixIcon: ref
                          .read(searchPageControllerProvider.notifier)
                          .searchFieldController
                          .text
                          .isNotEmpty
                      ? TKXDiconButtonWidget(
                          onPressed: ref
                              .read(searchPageControllerProvider.notifier)
                              .clearSearch,
                          icon: Icon(
                            Icons.close,
                            color: TKXDtheme.of(context).iconColor,
                          ),
                        )
                      : null,
                  border: InputBorder.none,
                  hintText: 'Search',
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
