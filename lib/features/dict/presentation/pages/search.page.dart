import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/widgets/appBar.widget.dart';
import '../../../../common/theme/widgets/iconButton.widget.dart';
import '../controllers/search.controller.dart';
import '../controllers/search.state.dart';
import '../widgets/searchLoaded.widget.dart';
import '../widgets/textField.widget.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchPageControllerProvider);
    final notifier = ref.watch(searchPageControllerProvider.notifier);

    Widget createBody() {
      if (state is SearchLoaded) {
        return state.kanji.isNotEmpty
            ? SearchLoadedWidget(
                // Pass a key so that the scroll positon is rested which a new query
                key: Key(notifier.searchFieldController.text),
                kanji: state.kanji,
              )
            : const Text('No kanji');
      } else if (state is SearchInitial) {
        return const Text('initial');
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
        title: SearchPageTextField(
          searchPageController: notifier,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Hide keyboard when clicking outside app bar
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: createBody(),
      ),
    );
  }
}
