import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/theme.widget.dart';
import '../../../../common/theme/widgets/appBar.widget.dart';
import '../../../../common/theme/widgets/iconButton.widget.dart';
import '../../../../common/theme/widgets/textField.widget.dart';
import '../controllers/search.controller.dart';
import '../controllers/search.state.dart';
import '../widgets/searchLoaded.widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(searchPageControllerProvider);
          final notifier = ref.watch(searchPageControllerProvider.notifier);

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
                onPressed: () => notifier.navigateBack(context),
              ),
              title: TKXDtextFieldWidget(
                placeholder: 'Search',
                autofocus: true,
                controller: notifier.searchFieldController,
                focusNode: notifier.searchFieldFocus,
                suffixIcon: state is SearchInitial && !state.isActive
                    ? null
                    : TKXDiconButtonWidget(
                        onPressed: ref
                            .read(searchPageControllerProvider.notifier)
                            .clearSearch,
                        icon: Icon(
                          Icons.close,
                          color: TKXDtheme.of(context).iconColor,
                        ),
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
