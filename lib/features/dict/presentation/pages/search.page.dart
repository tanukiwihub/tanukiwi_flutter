import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/widgets/appBar.widget.dart';
import '../../../../common/theme/widgets/iconButton.widget.dart';
import '../controllers/search.controller.dart';
import '../controllers/search.state.dart';
import '../widgets/searchLoaded.widget.dart';
import '../widgets/textField.widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(searchPageControllerProvider);
          final notifier = ref.watch(searchPageControllerProvider.notifier);

          Widget body = Container();

          if (state is SearchLoaded) {
            body = state.kanji.isNotEmpty
                ? SearchLoadedWidget(kanji: state.kanji)
                : const Text('No kanji');
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
                onPressed: () => notifier.navigateBack(context),
              ),
              title: SearchPageTextField(
                searchPageController: notifier,
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
